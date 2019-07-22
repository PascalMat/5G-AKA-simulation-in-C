/*
 ============================================================================
 Name        : UE.c
 Author      : Pascal Mathias
 Version     : 0.1
 Copyright   : This application is part of my master thesis
 Description : UE Application in the 5G-AKA
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <time.h>
#include "identifier.h"
#include "USIM.h"
#include "genericFunctions.h"

#define CL_PORT	50000
#define SV_PORT 50001
#define BUFSIZE 2048

#include "defs.h"

static void calc_XRESstar(uint8_t XRESstar[32], sn_name_t sn_name, uint8_t rand[16], uint8_t res[8], uint8_t ck[16],uint8_t ik[16]){
#ifdef showmethod
	printf("UDM: getXRESstar\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif
	// RES* and XRES* derivation function (TS33.501, Annex A.4)
	int n = 3, rand_size=16, res_size=8;

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

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("calc_HXRESstar Duration %lu\n",z-y);
#endif
	return;
}

int main(void) {

	initUSIM();
	time_t t;
	uint64_t a;

	printf("UE Start\n",a);
	// Variable declaration
	struct sockaddr_in clAddr;
	struct sockaddr_in seafAddr;
	socklen_t addrlen = sizeof(seafAddr);
	int cl, recvlen;
	int  slen=sizeof(seafAddr);
	unsigned char buf[BUFSIZE];
	char *server ="127.0.0.1";

	//get_HomeNetworkPublicKey("127.0.0.1");

	// Set up client
	if ((cl = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
		perror("cannot create socket");
		exit(1);
	}
	memset((char *)&clAddr, 0, sizeof(clAddr));
	clAddr.sin_family = AF_INET;
	clAddr.sin_addr.s_addr = htonl(INADDR_ANY);
	clAddr.sin_port = htons(CL_PORT);
	if(bind(cl, (struct sockaddr *)&clAddr, sizeof(clAddr))<0){
		perror("Bind failed");
		close(cl);
		return 0;
	}

	memset((char *) &seafAddr, 0, sizeof(seafAddr));
	seafAddr.sin_family = AF_INET;
	seafAddr.sin_port = htons(SV_PORT);
	if (inet_aton(server, &seafAddr.sin_addr)==0) {
		fprintf(stderr, "inet_aton() failed\n");
		exit(1);
	}
#ifdef measure
	printf("Tin: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
	suci_t suci;
	uint8_t rand[16];
	uint8_t autn[16];
	get_SUCI(&suci);
#ifdef testb
	printf("AuthReq\n");
#endif
	strcpy(buf, "AuthReq");
	strncat(buf, suci.mcc_mnc,sizeof(suci.mcc_mnc));
	strncat(buf, suci.msin,sizeof(suci.msin));
	strncat(buf, suci.ecc_pub_key,sizeof(suci.ecc_pub_key));
#ifdef testb
	for(int i=0; i< strlen(buf);i++){
		printf("%x", buf[i]);
	}
	puts("\n");
#endif
#ifdef showmethod
	printf("Send Authentication Request\n");
#endif
#ifdef measure
	printf("Tout: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
	if(sendto(cl, buf, strlen(buf), 0,(struct sockaddr *)&seafAddr, slen)==-1){
		perror("sendto");
		exit(1);
	}
	recvlen = recvfrom(cl, buf, BUFSIZE, 0, (struct sockaddr *)&seafAddr, &slen);
#ifdef showmethod
	printf("Receive Authentication Request\n");
#endif

	if(recvlen>=0){
		buf[recvlen]=0;
		//printf("MSG: ");
		for(int i=0;i<sizeof(buf);i++){
			if(i<16){
			//	printf("%x",buf[i]);
				rand[i] = buf[i];
			} else
				if(i<32){
			//		printf("%x",buf[i]);
					autn[i-16]=buf[i];
			}
		}
		printf("\n");
	}
#ifdef measure
	printf("Tin: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
#ifdef testb
	printf("Rand: ");
	for(int i=0;i<sizeof(rand);i++){
		printf("%x",rand[i]);
	}
	printf("\n");
	printf("Autn: ");
	for(int i=0;i<sizeof(autn);i++){
		printf("%x",autn[i]);
	}
	printf("\n");
#endif
	// Check if AUTN is accepted
	if(autnIsAccepted(autn, rand)!=1){
		return EXIT_FAILURE;
	}
	// Compute RES
	uint8_t res[8], ck[16], ik[16], res_star[32];
	computeRES(autn, rand, &res, &ck, &ik);

	// Compute RES_star
	calc_XRESstar(&res_star,sn_name_home,rand, res, ck, ik);
#ifdef testb
	printf("UE: RES_star\n");
	printf("\t res_star: ");
	for(int i = 0; i<32;i++){
		printf("%x",res_star[i]);
	}
	printf("\n");
#endif

	sprintf(buf, "AuthRes");
	for(int i=0;i<32;i++){
		buf[i+7]=res_star[i];
	}
	//strncat(buf, res_star, 32);
#ifdef testb
	printf("BUFFER: ");
	for(int i=0;i<39;i++){
		printf("%x",buf[i]);
	}
	printf("\n");
#endif
#ifdef measure
	printf("Tout: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
#endif
#ifdef showmethod
	printf("Send Authentication Response\n");
#endif
		if(sendto(cl, buf, 39 , 0,(struct sockaddr *)&seafAddr, slen)==-1){
			perror("sendto");
			exit(1);
		}
	close(cl);

	printf("UE Exit\n");
	return EXIT_SUCCESS;
}


