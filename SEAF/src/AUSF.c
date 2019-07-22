/*
 * AUSF.c
 *
 *  Created on: 23.04.2019
 *      Author: pascalmathias
 */

#include "AUSF.h"
#include "UDM.h"
#include <openssl/sha.h>
#include <sys/time.h>
#include "genericFunctions.h"
#include <string.h>

static char* serving_names[9][10];
static const char allowed_sn_names[] = "5G:NTNUnet";
static int sn_counter = 0;
static he_av_t he_av;
static av_t av;
static int ebene = 1;
// return 1 when SNName is verified. 0 if not
static int check_SNName(sn_name_t* sn_name){
#ifdef showmethod
	printm(ebene,"AUSF: check_SNName\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif
	int ret = 1;
	int a = strcmp(sn_name, allowed_sn_names);
	if(a!=0){
		ret=0;
	}
#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("check_SNName Duration %lu\n",z-y);
#endif
	return ret;
}

static int store_SNName(sn_name_t* sn_name){
#ifdef showmethod
	printm(ebene,"AUSF: storeSNName\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif
	int ret = 0;
	strcpy(serving_names[sn_counter],sn_name);
	if(sn_counter<sizeof(serving_names)){
		sn_counter++;
		ret = -1;
	} else {
		printf("Storage full!");
	}

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("store_SNName Duration %lu\n",z-y);
#endif
	return ret;
}

static void store_Kausf(uint8_t* k_ausf){

}

static void derive_Kseaf(uint8_t* k_seaf, uint8_t* k_ausf, sn_name_t sn_name){
#ifdef showmethod
	printm(ebene,"AUSF: deriveK_seaf\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif
	// K_seaf derivation function (TS33.501, Annex A.6)
	int n = 1;

	uint8_t fc = 0x6c;
	const char *pn[n];
	uint16_t ln[n];
	pn[0] = sn_name;
	ln[0] = SIZE_SN_NAME;


	genericKeyDerivation(k_ausf, sizeof(k_ausf),fc,pn,ln,n,k_seaf);


#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("derive_Kseaf Duration %lu\n",z-y);
#endif
	return;
}

static void calc_HXRESstar(uint8_t hxres_star[16], uint8_t xres_star[32], uint8_t rand[16]){
#ifdef showmethod
	printm(ebene,"AUSF: computeHXRES\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

#ifdef testb
	printf("\t res_star: ");
	for(int i = 0; i<32;i++){
		printf("%x",xres_star[i]);
	}
	printf("\n");
	printf("\t rand: ");
	for(int i = 0; i<16;i++){
		printf("%x",rand[i]);
	}
	printf("\n");
#endif
	// HRES* and HXRES* derivation function (TS33.501, Annex A.5)
	int n = 2;

	int rand_size = 16, xres_star_size = 32;
	uint8_t fc = NULL;
	unsigned char s[rand_size + xres_star_size];
	uint16_t ln[n];
	for(int i=0; i<rand_size;i++){
		s[i] = (unsigned char)rand[i];
	}
	for(int i=0; i<xres_star_size;i++){
		s[rand_size + i] = (unsigned char)xres_star[i];
	}

	const unsigned char s_tmp[sizeof(s)], md[32];
	memcpy(s_tmp, s, sizeof(s));
	//SHA256
	SHA256(s, sizeof(s), md);
	for(int i=0; i< sizeof(md);i++){
		hxres_star[i]= (uint8_t) md[i];

	}

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("calc_HXRESstar Duration %lu\n",z-y);
#endif
	return;
}

void ausf_init(){
#ifdef showmethod
	printm(ebene,"AUSF: initAUSF\n");
#endif
	udm_init();
}

void ausf_close(){}

void Nausf_UEAuthenticationRequest(se_av_t* se_av, suci_t* suci, sn_name_t* sn_name){
#ifdef showmethod
	printm(ebene,"AUSF: Nausf_UEAuthenticationRequest Begin\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

#ifdef measure
	printf("Tin: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif

	// Check serving network name
	if(check_SNName(sn_name)){
		// Store received serving name
		store_SNName(sn_name);
#ifdef testb
		puts("SUCI.msin");
			for(int i=0; i<sizeof(suci->msin);i++){
				printf("%x", suci->msin[i]);
			}
			puts("\n");
			puts("SUCI.eccpubkey");
			for(int i=0; i<sizeof(suci->ecc_pub_key);i++){
				printf("%x", suci->ecc_pub_key[i]);
			}
			puts("\n");
#endif
		//Request to UDM
#ifdef measure
	printf("Tout: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
		Nudm_UEAuthenticationRequest(&he_av, suci, sn_name);
#ifdef measure
	printf("Tin: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
		#ifdef testb
			printf("AUSF: got AV\n");
		#endif
		memcpy(av.autn, he_av.autn, sizeof(he_av.autn));
		av.method = he_av.method;
		memcpy(av.rand, he_av.rand, sizeof(he_av.rand));
		memcpy(av.supi.mcc_mnc,he_av.supi.mcc_mnc,sizeof(he_av.supi.mcc_mnc));
		memcpy(av.supi.msin,he_av.supi.msin,sizeof(he_av.supi.msin));
		// Calculate HXRES*
		calc_HXRESstar(&av.hxres_star, he_av.xres_star, he_av.rand);
		derive_Kseaf(av.k_seaf, he_av.k_ausf, sn_name);

		// Store XRES*
		store_Kausf(he_av.k_ausf);
		//memcpy(se_av->rand, av.rand, sizeof(av.rand));
		for(int i=0; i<sizeof(av.rand); i++){
			se_av->rand[i] = av.rand[i];
		}

		//memcpy(se_av->autn, av.autn, sizeof(av.autn));
		for(int i=0; i<sizeof(av.autn); i++){
			se_av->autn[i] = av.autn[i];
		}
		//memcpy(se_av->hxres_star, av.hxres_star, sizeof(av.hxres_star));
		for(int i=0; i<sizeof(av.hxres_star); i++){
			se_av->hxres_star[i] = av.hxres_star[i];
		}
#ifdef testb
	printf("AUSF: AV authentication vector\n");
	printf("\t method: %d", av.method);
	printf("\n");
	printf("\t rand: ");
	for(int i=0; i<16; i++){
		printf("%x",av.rand[i]);
	}
	printf("\n");
	printf("\t autn: ");
	for(int i=0; i<16; i++){
		printf("%x",av.autn[i]);
	}
	printf("\n");
	printf("\t hxres_star: ");
	for(int i=0; i<32; i++){
		printf("%x",av.hxres_star[i]);
	}
	printf("\n");
	printf("\t k_seaf: ");
	for(int i=0; i<32; i++){
		printf("%x",av.k_seaf[i]);
	}
	printf("\n");
	printf("\t supi: ");
	for(int i=0; i<8; i++){
		if(i<3){
			printf("%x", av.supi.mcc_mnc[i]);
		} else {
			printf("%x", av.supi.msin[i-3]);
		}
	}
	printf("\n");
#endif

#ifdef testb
	printf("AUSF: SE_AV authentication vector\n");
	printf("\t rand: ");
	for(int i=0; i<16; i++){
		printf("%x",se_av->rand[i]);
	}
	printf("\n");
	printf("\t autn: ");
	for(int i=0; i<16; i++){
		printf("%x",se_av->autn[i]);
	}
	printf("\n");
	printf("\t hxres_star: ");
	for(int i=0; i<32; i++){
		printf("%x",se_av->hxres_star[i]);
	}
	printf("\n");
#endif

	}else {
		//return "SN is not authorized!";
#ifdef measure
	printf("Tout: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
		return;
	}
#ifdef measure
	printf("Tout: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("Nausf_UEAuthenticationRequest Duration %lu\n",z-y);
#endif
#ifdef showmethod
	printm(ebene,"AUSF: Nausf_UEAuthenticationRequest End\n");
#endif
	return;
}



int Nausf_UEAuthenticationResponse(uint8_t *res_star, supi_t *supi, uint8_t *kseaf){
#ifdef showmethod
	printm(ebene,"AUSF: Nausf_UEAuthenticationResponse Begin\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

#ifdef measure
	printf("Tin: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
	// Res Verification
	int result = 0;
	if(memcmp(he_av.xres_star, res_star, 32)==0){
		result =1;
		printf("res_star/xres_star compare successful\n");
		memcpy(supi->mcc_mnc, he_av.supi.mcc_mnc, sizeof(he_av.supi.mcc_mnc));
		memcpy(supi->msin, he_av.supi.msin, sizeof(he_av.supi.msin));
		memcpy(kseaf, av.k_seaf, sizeof(av.k_seaf));
		struct timeval tv;
		gettimeofday(&tv,NULL);
#ifdef measure
	printf("Tout: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
		Nudm_AuthenticationSuccessful(supi, tv, 2, serving_names[sn_counter-1]);
#ifdef measure
	printf("Tin: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
	} else {
		result = 0;
		printf("res_star/xres_star compare NOT successful\n");
	}
#ifdef measure
	printf("Tout: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("Nausf_UEAuthenticationResponse Duration %lu\n",z-y);
#endif
#ifdef showmethod
	printm(ebene,"AUSF: Nausf_UEAuthenticationResponse End\n");
#endif
	return result;
}
