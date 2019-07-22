/*
 * crypto.h
 *
 *  Created on: 16.05.2019
 *      Author: pascalmathias
 */

#ifndef CRYPTO_H_
#define CRYPTO_H_



#endif /* CRYPTO_H_ */



int encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
            unsigned char *iv, unsigned char *ciphertext);

int decrypt(unsigned char *ciphertext, int ciphertext_len, unsigned char *key,
            unsigned char *iv, unsigned char *plaintext);
