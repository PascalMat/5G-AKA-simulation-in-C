/*
 * UDM.c
 *
 *  Created on: 23.04.2019
 *      Author: pascalmathias
 */

#include "UDM.h"
#include "ffunction.h"
#include "genericFunctions.h"
#include "sidf.h"
#include <sys/time.h>
#include <time.h>

#define AKA_EAP 1;
#define AKA_5G 2;

#define UE_STORAGE_SIZE 3
#define UE_SUPI_A 0x0123456789abcde

static int ebene = 2;
// Dataset for one UE
typedef struct{
	supi_t supi;			// SUPI for
	uint8_t authMethod;		// Authentication methode. 5G-AKA or EAP'-AKA
	uint8_t sqn[6];			// Sequence number
	uint8_t key[SIZE_K]; 	// 128 (or 256) bits long, long-term key
} ue_unit_t;

// Storage for UE-Data
static ue_unit_t ue_storage[UE_STORAGE_SIZE];
/* initialize the Storage of UDM
 * TODO: static data in function -> in storage
 */
static void initUEStorage(){
#ifdef showmethod
	printm(ebene,"UDM: initUEStorage\n");
#endif
	for(int idx=0; idx<UE_STORAGE_SIZE; idx++){
		//strcpy(ue_storage[idx].supi, UE_SUPI_A);
		for(int jdx=0; jdx<3;jdx++){
			ue_storage[idx].supi.mcc_mnc[jdx]=idx;
		}
		for(int jdx=0; jdx<5;jdx++){
			ue_storage[idx].supi.msin[jdx]=idx;
		}
		ue_storage[idx].authMethod = AKA_5G;
		for(int jdx = 0; jdx < sizeof(ue_storage[idx].sqn);jdx++){
			ue_storage[idx].sqn[jdx] = 0;
		}

		for(int jdx=0; jdx<SIZE_K;jdx++){
			ue_storage[idx].key[jdx]=idx;
		}
	}
}


int getIndex(supi_t supi){
#ifdef showmethod
	printm(ebene,"UDM: getIndex\n");
#endif
	for(int idx=0; idx<UE_STORAGE_SIZE; idx++){
		if(memcmp(ue_storage[idx].supi.mcc_mnc, supi.mcc_mnc, 3)==0){
			printf("mcc_mnc is equal\n");
			if(memcmp(ue_storage[idx].supi.msin, supi.msin, 5)==0){
				printf("msin is equal\n");
				return idx;
			}

		}
	}
	return -1;
}


void generate_Autn(int stor_index, uint8_t rand[16], uint8_t autn[16]){
#ifdef showmethod
	printm(ebene,"UDM: generate_Autn\n");
#endif
#ifdef measurefct
	uint64_t a,b;
	a=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

	// AUTN = SQN XOR AK || AMF || MAC
	uint8_t amf[2] = {0x80,0x00};
	uint8_t mac_a[8];
	uint8_t ak[6];
	int i;

	f1(ue_storage[stor_index].key, rand, ue_storage[stor_index].sqn, amf, mac_a);
	uint8_t res[8], ck[16], ik[16];
	f2345(ue_storage[stor_index].key, rand, res, ck, ik, ak);
	for(i = 0; i<6;i++){
		autn[i]= ue_storage[stor_index].sqn[i] ^ ak[i];
	}

	for(i=6;i<8;i++){
		autn[i]= amf[i-6];
	}

	for(i=8;i<16;i++){
		autn[i]= mac_a[i-8];
	}
#ifdef testb
	printm(ebene,"UDM: Autn\n");
	printf("\t Autn: ");
		for(i = 0; i<16;i++){
			printf("%x ",autn[i]);
		}
		printf("\n");
	printf("\t AK: ");
	for(i = 0; i<6;i++){
		printf("%x",ak[i]);
	}
	printf("\n");
	printf("\t K: ");
	for(i = 0; i<SIZE_K;i++){
		printf("%x",ue_storage[stor_index].key[i]);
	}
	printf("\n");
	printf("\t SQN: ");
	for(i = 0; i<6;i++){
		printf("%x",ue_storage[stor_index].sqn[i]);
	}
	printf("\n");
	printf("\t CK: ");
	for(i = 0; i<16;i++){
		printf("%x",ck[i]);
	}
	printf("\n");
	printf("\t IK: ");
	for(i = 0; i<16;i++){
		printf("%x",ik[i]);
	}
	printf("\n");
	printf("\t RES: ");
	for(i = 0; i<8;i++){
		printf("%x",res[i]);
	}
	printf("\n");
#endif
#ifdef measurefct
	b=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",a);
	printf("B: %lu \n",b);
	printf("generate_Autn Duration %lu\n",b-a);
#endif
	return;
}

void derive_Kausf(sn_name_t sn_name, int stor_index, uint8_t rand[16],uint8_t kausf[32]){

#ifdef showmethod
	printm(ebene,"UDM: derive_Kausf\n");
#endif
#ifdef measurefct
	uint64_t a,b;
	a=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

	// K_ausf derivation function (TS33.501, Annex A.2)
	uint8_t ak[6];
	uint8_t res[8], ck[16], ik[16];
	f2345(ue_storage[stor_index].key, rand, res, ck, ik, ak);

	uint8_t fc = 0x6a;
	char pn[SIZE_SN_NAME + 6];
	uint16_t ln[2];
	for(int i=0; i<SIZE_SN_NAME;i++){
		pn[i] = sn_name[i];
	}
	ln[0] = SIZE_SN_NAME;
	for(int i = 0; i<6;i++){
		pn[ln[0]+i] = ue_storage[stor_index].sqn[i] ^ ak[i];
	} 	// SQN XOR AK
	ln[1] = 6; // Length of SQN XOR AK

	genericKeyDerivation(ue_storage[stor_index].key,SIZE_K,fc,(uint8_t*)pn,ln,2,kausf);

#ifdef measurefct
	b=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",a);
	printf("B: %lu \n",b);
	printf("derive_Kausf Duration %lu\n",b-a);
#endif
	return;
}

static void calc_XRESstar(uint8_t XRESstar[32], sn_name_t sn_name, int stor_index, uint8_t rand[16]){
#ifdef showmethod
	printm(ebene,"UDM: calc_XRESstar\n");
#endif
#ifdef measurefct
	uint64_t a,b;
	a=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

	// RES* and XRES* derivation function (TS33.501, Annex A.4)
	int n = 3, rand_size=16, res_size=8;
	uint8_t ak[6],res[8], ck[16], ik[16];
	f2345(ue_storage[stor_index].key, rand, res, ck, ik, ak);


	uint8_t fc = 0x6b;
	char pn[SIZE_SN_NAME+rand_size+res_size];
	uint16_t ln[n];
	for(int i=0; i<SIZE_SN_NAME;i++){
		pn[i] = sn_name[i];
	}
	ln[0] = SIZE_SN_NAME;

	for(int i=0; i<rand_size;i++){
		pn[ln[0]+i] = rand[i];
	}
	ln[1] = rand_size;

	for(int i=0; i<res_size;i++){
		pn[ln[0]+ln[1]+i] = res[i];
	}
	ln[2] = res_size;

	uint8_t tmp_key[SIZE_K];
	for(int i=0;i< 8;i++){
		tmp_key[i]=ck[i];
	}
	for(int i=0;i< 8;i++){
		tmp_key[8+i]=ik[i];
	}

	genericKeyDerivation(tmp_key,sizeof(tmp_key),fc,pn,ln,n,XRESstar);
#ifdef testb
	printf("UDM: RES_star\n");
	printf("\t res_star: ");
	for(int i = 0; i<32;i++){
		printf("%x",XRESstar[i]);
	}
	printf("\n");
#endif

#ifdef measurefct
	b=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",a);
	printf("B: %lu \n",b);
	printf("calc_XRESstar Duration %lu\n",b-a);
#endif
	return;
}

void udm_init(){
#ifdef showmethod
	printm(ebene,"UDM: initUDM\n");
#endif
	initUEStorage();
	sidf_init();
}

void udm_close(){

}


static void deconcealSUCI(supi_t* supi, suci_t* suci){
#ifdef showmethod
	printm(ebene,"UDM: deconcealSUCI\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

	size_t secretlen, keylen=128;
	unsigned char* sharedSecret;
	unsigned char key[128];
	unsigned char publicKey[65];
#ifdef testb
	puts("SUCI.msin");
	for(int i=0; i<sizeof(suci->msin);i++){
		printf("%x", suci->msin[i]);
	}
	puts("\n");
#endif
#ifdef testb
	puts("SUCI.eccpubkey");
#endif
	for(int i=0; i<sizeof(suci->ecc_pub_key);i++){
#ifdef testb
		printf("%x", suci->ecc_pub_key[i]);
#endif
		publicKey[i] = (unsigned char)suci->ecc_pub_key[i];
	}
#ifdef testb
	puts("\n");
#endif
	// TODO: generated key not used, instead fixed sharedsecret
	sharedSecret = getSharedSecret(&secretlen, &publicKey, 65); // TODO: get right shared secret
#ifdef testb
	puts("shared:");
	for(int i=0; i<secretlen;i++){
			printf("%X",sharedSecret[i]);
		}
	puts("");
#endif
	kdf(sharedSecret, secretlen, &keylen, NULL, 0, &key);		// TODO: What is wrong here?
	int a = decrypt(suci->msin, sizeof(suci->msin),key, 0, &supi->msin);
#ifdef testb
	printf("SUCI.msin: %d\n", a);
	for(int i=0; i<sizeof(suci->msin);i++){
		printf("%x", suci->msin[i]);
	}
	puts("\n");
	printf("SUPI.msin: %d\n", a);
	for(int i=0; i<sizeof(supi->msin);i++){
		printf("%x", supi->msin[i]);
	}
	puts("\n");
#endif

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("deconcealSuci Duration %lu\n",z-y);
#endif
	return;
}

int chooseAuthenticationMethod(int storageindex){
	return ue_storage[storageindex].authMethod;
}

void Nudm_UEAuthenticationRequest(he_av_t* av, suci_t* suci, sn_name_t* sn_name){
#ifdef showmethod
	printm(ebene,"UDM: Nudm_UEAuthenticationRequest Begin\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

#ifdef measure
	printf("Tin: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
	// Important delay. If this is not here, the programm crash. I don't know why
	for(int i=0; i<sizeof(suci->ecc_pub_key);i++){
		//		printf("%x", suci->ecc_pub_key[i]);
	}
#ifdef testb
	//printf("SUCI.msin");
	//	for(int i=0; i<sizeof(suci->msin);i++){
	//		printf("%x", suci->msin[i]);
	//	}
	//	puts("\n");
	//	puts("SUCI.eccpubkey");
		for(int i=0; i<sizeof(suci->ecc_pub_key);i++){
	//		printf("%x", suci->ecc_pub_key[i]);
		}
	//	puts("\n");
#endif
	// SUCI de-concealment
#ifdef testb
	printf("UDM: SUCI deconcealment\n");
#endif
	supi_t supi;
	deconcealSUCI(&supi, suci);
	// Authentication Method selection
#ifdef testb
	printf("UDM: select authentication method\n");
#endif
	int method;
	int stor_index = getIndex(supi);
	method = chooseAuthenticationMethod(stor_index);
#ifdef test
	printf("UDM: authentication method: %d\n",method);
#endif
	// Create authentication vector
#ifdef test
	printf("UDM: create authentication vector\n");
#endif
	//he_av_t HE_AV_5G;
	av->method = method;
	for(int idx=0; idx< sizeof(av->rand);idx++){
		av->rand[idx] = rand();
	}


	generate_Autn(stor_index,av->rand, av->autn);
	derive_Kausf(sn_name, stor_index, av->rand, av->k_ausf);
	calc_XRESstar(av->xres_star, sn_name, stor_index, av->rand );
	for(int idx=0; idx< sizeof(supi.mcc_mnc);idx++){
		av->supi.mcc_mnc[idx] = supi.mcc_mnc[idx];
	}
	for(int idx=0; idx< sizeof(supi.msin);idx++){
		av->supi.msin[idx] = supi.msin[idx];
	}
#ifdef test
	printf("UDM: authentication vector\n");
	printf("\t method: %d", method);
	printf("\n");
	printf("\t rand: ");
	for(int i=0; i<16; i++){
		printf("%x",av->rand[i]);
	}
	printf("\n");
	printf("\t autn: ");
	for(int i=0; i<16; i++){
		printf("%x",av->autn[i]);
	}
	printf("\n");
	printf("\t xres_star: ");
	for(int i=0; i<32; i++){
		printf("%x",av->xres_star[i]);
	}
	printf("\n");
	printf("\t k_ausf: ");
	for(int i=0; i<32; i++){
		printf("%x",av->k_ausf[i]);
	}
	printf("\n");
	printf("\t supi: ");
	for(int i=0; i<8; i++){
		if(i<3){
			printf("%x", av->supi.mcc_mnc[i]);
		} else {
			printf("%x", av->supi.msin[i-3]);
		}
	}
	printf("\n");
#endif
#ifdef measure
	printf("Tout: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("Nudm_AuthenticationRequest Duration %lu\n",z-y);
#endif
#ifdef showmethod
	printm(ebene,"UDM: Nudm_UEAuthenticationRequest End\n");
#endif
	return;
}

void Nudm_AuthenticationSuccessful(supi_t supi, struct timeval timestamp, int authType, sn_name_t sn_name){
#ifdef	showmethod
	printm(ebene,"UDM: Nudm_AuthenticationSuccessful\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

	printf("\tSUPI: ");
	for(int i=0; i<sizeof(supi.mcc_mnc);i++){
		printf("%x", supi.mcc_mnc[i]);
	}
	for(int i=0; i<sizeof(supi.msin);i++){
		printf("%x", supi.msin[i]);
	}
	printf("\n");
	if(authType==1){
		printf("\tAuthType: EAP-AKA'\n");
	}else if(authType==2){
		printf("\tAuthType: 5G-AKA'\n");
	}
	printf("\tSN-Name: ");
	for(int i=0; i<10;i++){
		printf("%c", sn_name[i]);
	}
	printf("\n");
	printf("\tTimestamp: %d\n", timestamp.tv_sec);

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("Nudm_AuthenticationSuccessful Duration %lu\n",z-y);
#endif
}

