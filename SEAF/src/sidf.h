/*
 * sidf.h
 *
 *  Created on: 09.05.2019
 *      Author: pascalmathias
 */

#include <stdlib.h>
#ifndef SIDF_H_
#define SIDF_H_
#include "defs.h"

unsigned char homeNetworkPublicKey[65];

void sidf_init();
unsigned char* getSharedSecret(size_t *secret_len, unsigned char* pubkey, size_t size_pubkey);
void kdf(unsigned char *sharedSecret, uint8_t sslen, size_t* keydatalen, char *sharedinfo, uint8_t silen, unsigned char* key);
int encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
            unsigned char *iv, unsigned char *ciphertext);
int decrypt(unsigned char *ciphertext, int ciphertext_len, unsigned char *key,
            unsigned char *iv, unsigned char *plaintext);
#endif /* SIDF_H_ */



