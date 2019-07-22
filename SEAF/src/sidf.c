/*
 *  sidf.c
 *
 *  Created on: 09.05.2019
 *  Author: pascalmathias
 *
 *
 */

#include "sidf.h"
#include <stdio.h>
#include <math.h>
#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/ec.h>
#include <openssl/err.h>
#include <openssl/sha.h>
#include <openssl/rsa.h>
#include <string.h>

/*--- Global variables ---*/
static EVP_PKEY_CTX *pctx, *kctx;
static EVP_PKEY *pkey = NULL, *peerkey = NULL, *params = NULL;
static int ebene = 3;

const int hashmaxlen = 256;

/*--- Functions ---*/

void handleErrors(void)
{
	ERR_print_errors_fp(stderr);
    abort();
}

void sidf_init(){
#ifdef showmethod
	printm(ebene,"SIDF: sidf_init\n");
#endif
	/* Create the context for parameter generation */
	if(NULL == (pctx = EVP_PKEY_CTX_new_id(EVP_PKEY_EC, NULL))) handleErrors();

	/* Initialise the parameter generation */
	if(1 != EVP_PKEY_paramgen_init(pctx)) handleErrors();

	/* We're going to use the ANSI X9.62 Prime 256v1 curve */
	if(1 != EVP_PKEY_CTX_set_ec_paramgen_curve_nid(pctx, NID_X9_62_prime256v1)) handleErrors();

	/* Create the parameter object params */
	if (!EVP_PKEY_paramgen(pctx, &params)) handleErrors();

	/* Create the context for the key generation */
	if(NULL == (kctx = EVP_PKEY_CTX_new(params, NULL))) handleErrors();

	/* Generate the key */
	if(1 != EVP_PKEY_keygen_init(kctx)) handleErrors();
	if (1 != EVP_PKEY_keygen(kctx, &pkey)) handleErrors();

	// Serialize Home Network Public Key
	EC_KEY* eckey = NULL;
	const EC_GROUP* ecgroup = EC_GROUP_new_by_curve_name(NID_X9_62_prime256v1);
	size_t size = 1000;
	unsigned char pubkey[size];
	unsigned char privatekey[size];
	size_t a;
	BN_CTX* ctx;
	ctx = BN_CTX_new();
	eckey = EVP_PKEY_get1_EC_KEY(pkey);
	const EC_POINT* ecpoint = EC_KEY_get0_public_key(eckey);
	a = EC_POINT_point2oct(ecgroup ,ecpoint ,EC_GROUP_get_point_conversion_form(ecgroup),pubkey,size,ctx);
	memcpy(homeNetworkPublicKey, pubkey,65);
	printf("Home Network Publickey[%lu]: ",a);
	for(int idx=0;idx<a;idx++){
		printf("%x", homeNetworkPublicKey[idx]);
	}
	printf("\n");

}

unsigned char* getSharedSecret(size_t *secret_len, unsigned char* pubkey, size_t size_pubkey){
#ifdef showmethod
	printm(ebene,"SIDF: getSharedSecret\n");
#endif
#ifdef measurefct
	uint64_t a,b;
	a=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

	unsigned char *secret;
	EVP_PKEY_CTX *ctx;

	EC_POINT* peerpoint;
	EC_KEY* peereckey;
	size_t secretLength;

	const EC_GROUP* ecgroup = EC_GROUP_new_by_curve_name(NID_X9_62_prime256v1);

	peereckey = EC_KEY_new_by_curve_name(NID_X9_62_prime256v1);
	ecgroup = EC_KEY_get0_group(peereckey);
	peerpoint = EC_POINT_new(ecgroup);

	const unsigned char* buf = pubkey;
	int f=-5,c=-5,d=-5;

#ifdef test
	printf("Publickey[%lu]: ",size_pubkey);
	for(int idx=0;idx<size_pubkey;idx++){
		printf("%x", pubkey[idx]);
	}
	printf("\n");
#endif
	f = EC_POINT_hex2point(ecgroup, buf, peerpoint, NULL);
	c = EC_KEY_set_public_key(peereckey, peerpoint);
	peerkey = EVP_PKEY_new();
	d = EVP_PKEY_set1_EC_KEY(peerkey,peereckey);

	/* To serialize the public key:

	Pass the EVP_PKEY to EVP_PKEY_get1_EC_KEY() to get an EC_KEY.
	Pass the EC_KEY to EC_KEY_get0_public_key() to get an EC_POINT.
	Pass the EC_POINT to EC_POINT_point2oct() to get octets, which are just unsigned char *.
	 */


	if(NULL == (ctx = EVP_PKEY_CTX_new(pkey, NULL))) handleErrors();

	/* Initialise */
	if(1 != EVP_PKEY_derive_init(ctx)) handleErrors();

	/* Provide the peer public key */
	if(1 != EVP_PKEY_derive_set_peer(ctx, peerkey)) handleErrors();

	/* Determine buffer length for shared secret */
	if(1 != EVP_PKEY_derive(ctx, NULL, &secretLength)) handleErrors();

	/* Create the buffer */
	if(NULL == (secret = OPENSSL_malloc(secretLength))) handleErrors();

	/* Derive the shared secret */
	int e = EVP_PKEY_derive(ctx, secret, &secretLength);
	//if(1 != (EVP_PKEY_derive(ctx, secret, &secretLength))) handleErrors();
#ifdef test
	printf("a%d %s\n",e, secret);
	for(int i=0; i<secretLength;i++){
		printf("%X", secret[i]);
	}
	//if(1 != (e)) handleErrors();
	printf("a %d\n", secretLength);
#endif
	EVP_PKEY_CTX_free(ctx);
	EVP_PKEY_free(peerkey);

	/* Never use a derived secret directly. Typically it is passed
	 * through some hash function to produce a key */
	*secret_len = secretLength;

	//TODO: sharedsecret doesn't work -> fixed secret
	/*for(int cnt=0; cnt<secretLength;cnt++){
		secret[cnt] = '0';
	}*/

#ifdef measurefct
	b=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",a);
	printf("B: %lu \n",b);
	printf("SharedSecret Duration %lu\n",b-a);
#endif
	return secret;
}

void kdf(unsigned char *sharedSecret, uint8_t sslen, size_t* keydatalen, char *sharedinfo, uint8_t silen, unsigned char* key){
	//SEC 1: Elliptic Curve Cryptography, 3.6.1
#ifdef showmethod
	printm(ebene,"SIDF: kdf\n");
#endif
#ifdef measurefct
	uint64_t a,b;
	a=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif
#ifdef testb
	puts("shared:");
		for(int i=0; i<sslen;i++){
				printf("%X",sharedSecret[i]);
			}
		puts("");
#endif
	int hashlen = sslen + silen + 4;
	int i;
#ifdef testb
	printf("%d : %d\n",hashlen, hashmaxlen);
	printf("%d : %d\n",sslen, silen);
#endif
	if((hashlen) >= hashmaxlen){
		*key = "invalid";
		*keydatalen = strlen(key);
		return;
	}
	/*unsigned a =(unsigned)pow(2,32) - 1;
	unsigned b = hashlen * a;
	printf("keydatalen: %d, hashlen: %u, %u\n",*keydatalen, a,b);
	if(*keydatalen >= a){
		*key = "invalid";
		*keydatalen = strlen(key);
		return;
	}*/
	uint32_t counter = 0x00000001;

	for(i = 0; i<*keydatalen; i++){
		//printf("i: %d %d\n",i,sslen);
		unsigned char hashinput[hashlen], md[32]; //= malloc(hashlen);
		for(int i=0; i<sslen;i++){
			hashinput[i] = sharedSecret[i];
		}
		//memcpy(hashinput, sharedSecret, sslen);
		//printf("hashinput: %s\n", hashinput);
		unsigned char tmp[4];
		sprintf(tmp, "%x", counter);
		strncat(hashinput, tmp, 4);
		//strncat(hashinput, sharedinfo, silen);

		//printf("hashinput: %s\n", hashinput);
		SHA256(hashinput,sizeof(hashinput),md);
		key[i] = md[0];
		counter++;
		//free(hashinput);
	}

#ifdef testb
	printf("Keydatalen: %u\n", *keydatalen);
	for(i=0; i<*keydatalen;i++){
		printf("%2x",key[i]);
	}
	puts("\n");
#endif

#ifdef measurefct
	b=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",a);
	printf("B: %lu \n",b);
	printf("kdf Duration %lu\n",b-a);
#endif
}

int encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
            unsigned char *iv, unsigned char *ciphertext)
{
#ifdef showmethod
	printm(ebene,"SIDF: encrypt\n");
#endif
#ifdef measurefct
	uint64_t a,b;
	a=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif
	EVP_CIPHER_CTX *ctx;

    int len;

    int ciphertext_len;

    /* Create and initialise the context */
    if(!(ctx = EVP_CIPHER_CTX_new()))
        handleErrors();

    /*
     * Initialise the encryption operation. IMPORTANT - ensure you use a key
     * and IV size appropriate for your cipher
     * In this example we are using 256 bit AES (i.e. a 256 bit key). The
     * IV size for *most* modes is the same as the block size. For AES this
     * is 128 bits
     */
    if(1 != EVP_EncryptInit_ex(ctx, EVP_aes_128_ctr(), NULL, key, iv))
        handleErrors();

    /*
     * Provide the message to be encrypted, and obtain the encrypted output.
     * EVP_EncryptUpdate can be called multiple times if necessary
     */
    if(1 != EVP_EncryptUpdate(ctx, ciphertext, &len, plaintext, plaintext_len))
        handleErrors();
    ciphertext_len = len;

    /*
     * Finalise the encryption. Further ciphertext bytes may be written at
     * this stage.
     */
    if(1 != EVP_EncryptFinal_ex(ctx, ciphertext + len, &len))
        handleErrors();
    ciphertext_len += len;

    /* Clean up */
    EVP_CIPHER_CTX_free(ctx);

    return ciphertext_len;
#ifdef measurefct
	b=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",a);
	printf("B: %lu \n",b);
	printf("encrypt Duration %lu\n",b-a);
#endif
}

int decrypt(unsigned char *ciphertext, int ciphertext_len, unsigned char *key,
            unsigned char *iv, unsigned char *plaintext)
{
#ifdef showmethod
	printm(ebene,"SIDF: decrypt\n");
#endif
#ifdef measurefct
	uint64_t a,b;
	a=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif
	EVP_CIPHER_CTX *ctx;

    int len;

    int plaintext_len;

    /* Create and initialise the context */
    if(!(ctx = EVP_CIPHER_CTX_new()))
        handleErrors();

    /*
     * Initialise the decryption operation. IMPORTANT - ensure you use a key
     * and IV size appropriate for your cipher
     * In this example we are using 256 bit AES (i.e. a 256 bit key). The
     * IV size for *most* modes is the same as the block size. For AES this
     * is 128 bits
     */
    if(1 != EVP_DecryptInit_ex(ctx, EVP_aes_128_ctr(), NULL, key, iv))
        handleErrors();

    /*
     * Provide the message to be decrypted, and obtain the plaintext output.
     * EVP_DecryptUpdate can be called multiple times if necessary.
     */
    if(1 != EVP_DecryptUpdate(ctx, plaintext, &len, ciphertext, ciphertext_len))
        handleErrors();
    plaintext_len = len;

    /*
     * Finalise the decryption. Further plaintext bytes may be written at
     * this stage.
     */
    if(1 != EVP_DecryptFinal_ex(ctx, plaintext + len, &len))
        handleErrors();
    plaintext_len += len;

    /* Clean up */
    EVP_CIPHER_CTX_free(ctx);

#ifdef measurefct
	b=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",a);
	printf("B: %lu \n",b);
	printf("decrypt Duration %lu\n",b-a);
#endif
    return plaintext_len;
}

