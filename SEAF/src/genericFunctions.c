/*
 * genericFunctions.c
 *
 *  Created on: 15.05.2019
 *      Author: pascalmathias
 */

#include "genericFunctions.h"
#include "identifier.h"
#include "deps/hmac-sha256/hmac-sha256.h"
#include <time.h>

// TS33.220 Annex B.2
void genericKeyDerivation(uint8_t *key ,uint8_t keysize,uint8_t fc, uint8_t* pn, uint16_t* ln, uint8_t n, uint8_t output[32]){
#ifdef showmethod
	printf("genericKeyDerivation\n");
#endif
#ifdef measurefct
	uint64_t a,b;
	a = clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif
	// S = FC || P0 || L0 || P1 || L1 || P2 || L2 || P3 || L3 ||... || Pn || Ln
	size_t datalength = 1;
	for (int i = 0; i<n; i++){
		datalength += ln[i];
	}
	uint8_t s[datalength];

	s[0] = fc;
	int start = 1;
	for(int i = 0; i<n; i++){
		for(int j=0; j<ln[i]; j++){
			s[start+j]=pn[start+j-1];
		}
		s[start+ln[i]]= ln[i];
		s[start+ln[i]+1]= (ln[i]>>8);

		start += ln[i]+2;
	}

	//derivedKey = HMAC-SHA-256(key,s)
	hmac_sha256(output, s, datalength, key, keysize);//SIZE_K);

#ifdef measurefct
	b=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",a);
	printf("B: %lu \n",b);
	printf("genericKeyDerivation Duration %lu\n",b-a);
#endif
}

void printm(int numberoftabs, char* s){
	for(int i=0; i<numberoftabs;i++){
		printf("\t");
	}
	printf(s);
	printf("\n");
}


