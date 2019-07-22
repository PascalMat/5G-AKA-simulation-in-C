/*
 ============================================================================
 Name        : SEAF.c
 Author      : Pascal Mathias
 Version     : 0.1
 Copyright   : This application is part of my master thesis
 Description : SEAF Application in the 5G-AKA
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include "identifier.h"
#include "av_types.h"
#include "AUSF.h"
#include "sidf.h"
#include "defs.h"
#include <time.h>
#include "genericFunctions.h"

#define SV_PORT	50001

#define BUFSIZE 2048

sn_name_t sn_name = "5G:NTNUnet";
static se_av_t se_av;
static supi_t supi;
static uint8_t kseaf[32];
static int ebene = 0;
static void calc_HRESstar(uint8_t hres_star[16], uint8_t res_star[32], uint8_t rand[16]){
#ifdef showmethod
	printm(ebene,"SEAF: computeHRES\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

#ifdef testb
	printf("\t res_star: ");
	for(int i = 0; i<32;i++){
		printf("%x",res_star[i]);
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
		s[rand_size + i] = (unsigned char)res_star[i];
	}

	const unsigned char s_tmp[sizeof(s)], md[32];
	memcpy(s_tmp, s, sizeof(s));
	//SHA256
	SHA256(s, sizeof(s), md);
	for(int i=0; i< sizeof(md);i++){
		hres_star[i]= (uint8_t) md[i];

	}

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("calc_HRESstar Duration %lu\n",z-y);
#endif
	return;
}


static void derive_Kamf(uint8_t* k_amf, uint8_t* k_seaf, supi_t supi){
#ifdef showmethod
	printm(ebene,"SEAF: derive_Kamf\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

	// K_amf derivation function (TS33.501, Annex A.7)
	int n = 2;

	uint8_t fc = 0x6d;
	const char *pn[n];
	uint16_t ln[n];
	char *supi_tmp;
	strcpy(supi_tmp,supi.mcc_mnc);
	strncat(supi_tmp, supi.msin,5);
	pn[0] = supi_tmp;
	ln[0] = 8;
	pn[1] = 0x0000;	// ABBA parameter, see TS33.501, Annex A.7.1
	ln[1] = sizeof(0x0000);

	genericKeyDerivation(k_seaf, sizeof(k_seaf),fc,pn,ln,n,k_amf);

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("derive_Kamf Duration %lu\n",z-y);
#endif
	return;
}


static void Nseaf_UEAuthenticationRequest( se_av_t* se_av,unsigned char * msg){
#ifdef showmethod
	printm(ebene,"SEAF: Nseaf_UEAuthenticationRequest Begin\n");
#endif
#ifdef measure
	printf("Tin: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

	// Extract SUCI/5G-GUTI
	suci_t suci;

	int actualSize = 7, start= 7;
	actualSize += sizeof(suci.mcc_mnc);
	// Get MCC & MNC
	//puts("\nmcc_mnc: ");
	for(int i=start;i<actualSize;i++){
	//	printf("%x", msg[i]);
		suci.mcc_mnc[i-start]=(uint8_t)msg[i];
	}

	// Get MSIN
	start =actualSize;
	actualSize += sizeof(suci.msin);
	//puts("\nmsin:");
	for(int i=start;i<actualSize;i++){
	//	printf("%x", msg[i]);
		suci.msin[i-start]=(uint8_t)msg[i];
	}

	// Get ECC Public Key
	start =actualSize;
	actualSize += sizeof(suci.ecc_pub_key);
	//puts("\neccpubkey:");
	for(int i=start;i<actualSize;i++){
	//	printf("%x", msg[i]);
		suci.ecc_pub_key[i-start]=(uint8_t)msg[i];
	}
//	printf("\n");

	// Authenticate Request (AUSF)
#ifdef measure
	printf("Tout: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
	Nausf_UEAuthenticationRequest(se_av, &suci, sn_name);
#ifdef measure
	printf("Tin: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
#ifdef testb
		printf("SEAF: SE_AV authentication vector\n");
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

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("Nseaf_UEAuthenticationRequest Duration %lu\n",z-y);
#endif
#ifdef measure
	printf("Tout: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
#ifdef showmethod
	printm(ebene,"SEAF: Nseaf_UEAuthenticationRequest End\n");
#endif
	return;
}

static void Nseaf_UEAuthenticationResponse(unsigned char* res){
#ifdef showmethod
	printm(ebene,"SEAF: Nseaf_UEAuthenticationResponse Begin\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

#ifdef measure
	printf("Tin: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
	uint8_t res_star[32], hres_star[32];
#ifdef testb
	printf("\tRES: ");
#endif
	for(int i=0; i<39;i++){
#ifdef testb
		printf("%x",res[i]);
#endif
		if(i>6){
			res_star[i-7] = res[i];
		}
	}
#ifdef testb
	printf("\n");
	printf("\tRES_Star: ");
	for(int i=0; i<32;i++){
		printf("%x",res_star[i]);
	}
	printf("\n");
#endif
	// Calculate HRES* and
	calc_HRESstar(&hres_star, res_star, se_av.rand);
	// Compare HXRES*
	int hrescmp = memcmp(hres_star, se_av.hxres_star,32);
	if(hrescmp == 0){
		printf("hres_star/hxres_star compare successful!\n");
	} else {
		printf("hres_star/hxres_star compare NOT successful!\n");
	}

	int ret;
#ifdef measure
	printf("Tout: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
	ret = Nausf_UEAuthenticationResponse(res_star, &supi, &kseaf); // Result, [SUPI], Kseaf
	printf("Authentication Result: %d \n", ret);
#ifdef measure
	printf("Tin: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("Nseaf_UEAuthenticationResponse Duration %lu\n",z-y);
#endif
#ifdef measure
	printf("Tout: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
#ifdef showmethod
	printm(ebene,"SEAF: Nseaf_UEAuthenticationResponse End\n");
#endif
}

static void seaf_init(){
#ifdef showmethod
	printm(ebene,"SEAF: seaf_init\n");
#endif
	ausf_init();
}

static void seaf_close(){
#ifdef showmethod
	printf("SEAF: seaf_close\n");
#endif
}

int main(void) {
	printm(ebene,"Start SEAF\n");
	seaf_init();
	// Variable declaration
	uint64_t a,b;
	struct sockaddr_in svAddr;
	struct sockaddr_in recvAddr;
	socklen_t addrlen = sizeof(recvAddr);
	int sv;
	int recvlen;
	unsigned char buf[BUFSIZE];
	//se_av_t se_av;

	// Set up server
	if ((sv = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
		perror("cannot create socket");
		exit(1);
	}

	memset((char *)&svAddr, 0, sizeof(svAddr));
	svAddr.sin_family = AF_INET;
	svAddr.sin_addr.s_addr = htonl(INADDR_ANY);
	svAddr.sin_port = htons(SV_PORT);

	if(bind(sv, (struct sockaddr *)&svAddr, sizeof(svAddr))<0){
		perror("Bind failed");
		return 0;
	}


	printf("SEAF-server started, listening on port %d\n", SV_PORT);

	// loop for receiving
	for (int idx = 0;idx < 3; idx++) {
		printf("waiting on port %d\n", SV_PORT);
		recvlen = recvfrom(sv, buf, BUFSIZE, 0, (struct sockaddr *)&recvAddr, &addrlen);
		if (recvlen > 0) {
			buf[recvlen] = 0;
#ifdef test
			printf("received message (%d bytes) :", recvlen);
			for(int i=0;i<recvlen;i++){
				printf("%x",buf[i]);
			}
			printf("\n");
#endif
			if(strncmp(buf,"getHNPK",7)==0){
				strcpy(buf, homeNetworkPublicKey);//,65);
				buf[65]=0;
				if (sendto(sv, buf, strlen(buf), 0, (struct sockaddr *)&recvAddr, addrlen) < 0)
							perror("Send HNPK");
			}
			if(strncmp(buf,"AuthReq",7)==0){

				Nseaf_UEAuthenticationRequest(&se_av, buf);
				// TODO: Response to UE, add ngKSI
				// Create buf = Rand || AUTN (||ngKSI)
				#ifdef test
					printf("SEAF: SE_AV authentication vector\n");
					printf("\t rand: ");
					for(int i=0; i<16; i++){
						printf("%x",se_av.rand[i]);
					}
					printf("\n");
					printf("\t autn: ");
					for(int i=0; i<16; i++){
						printf("%x",se_av.autn[i]);
					}
					printf("\n");
					printf("\t hxres_star: ");
					for(int i=0; i<32; i++){
						printf("%x",se_av.hxres_star[i]);
					}
					printf("\n");
				#endif
				uint8_t tmp[32];
				for(int i=0; i<32;i++){
					if(i<16){
						tmp[i]= se_av.rand[i];
					} else {
						tmp[i]= se_av.autn[i-16];
					}
				}
				memcpy(buf,tmp,sizeof(tmp));

				buf[32]=0;

#ifdef test
				printf("BUFFER: ");
				for(int i=0;i<sizeof(tmp);i++){
					printf("%x",buf[i]);
				}
				printf("\n");
#endif
#ifdef measure
	printf("Tout: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
				if (sendto(sv, buf, sizeof(tmp), 0, (struct sockaddr *)&recvAddr, addrlen) < 0)
							perror("AuthenticationRequest");
			} else if (strncmp(buf,"AuthRes",7)==0){

				Nseaf_UEAuthenticationResponse(buf);
			}
		}
		else
			printf("Message Unknown\n");

		// Answer
		//sprintf(buf, "ack");


	}

	b = clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
//#ifdef measure
//	printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
//#endif
//#ifdef measure
//	printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
//	printf("A: %lu \n",a);
//	printf("B: %lu \n",b);
//	printf("Duration %lu\n",b-a);
//#endif
	close(sv);
	printm(ebene,"Authentication End\n");
	return EXIT_SUCCESS;
}


