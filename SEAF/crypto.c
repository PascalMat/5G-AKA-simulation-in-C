/*
 * crypto.c
 *
 *  Created on: 16.05.2019
 *      Author: pascalmathias
 */

#include <stdio.h>
#include <math.h>
#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/ec.h>
#include <openssl/err.h>
#include <openssl/sha.h>
#include <string.h>

EVP_PKEY_CTX *pctx, *kctx;
EVP_PKEY *pkey = NULL, *peerkey = NULL, *params = NULL;

const uint8_t hashmaxlen = 256;

void handleErrors(void)
{
	ERR_print_errors_fp(stderr);
    abort();
}

//  ANS X9.63 Key Derivation Function
/*
 * sharedSecret (Z)
 * sslen - Length of sharedSecret
 * keydatalen - Length of keying data in octets
 * sharedInfo
 * silen - Lenght of Shared Info
 * key - Output of the key data
 */
static void kdf(char *sharedSecret, uint8_t sslen, uint8_t* keydatalen, char *sharedinfo, uint8_t silen, char* key){
	int hashlen = sslen + silen + 4;
	int i;
	if((hashlen) >= hashmaxlen){
		*key = "invalid";
		*keydatalen = strlen(key);
		return;
	}

	if(keydatalen >= (long)(hashlen * (pow(2,32) - 1))){
		*key = "invalid";
		*keydatalen = strlen(key);
		return;
	}

	uint32_t counter = 0x00000001;


	for(i = 0; i<hashlen; i++){
		char * hashinput =(char *)malloc(hashlen);
		strncpy(hashinput, sharedSecret, sslen);
		strncat(hashinput, counter, 4);
		strncat(hashinput, sharedinfo, silen);
		SHA256_CTX ctx;
		SHA256_Init(&ctx);
		SHA256_Update(&ctx,hashinput,sizeof(hashinput));
		SHA256_Final(&ctx,key[i]);
		//key[i] = SHA256(); 		// SHA256 (Sharedsecret||Counter||Sharedinfo)
		counter++;
		free(hashinput);
	}
	*keydatalen = (uint8_t) hashlen;

}

void init_ecdh(){
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
}

void get_peerkey(EVP_PKEY* pkey){

}

unsigned char *ecdh(size_t *secret_len)
{
	EVP_PKEY_CTX *pctx, *kctx;
	EVP_PKEY_CTX *ctx;
	unsigned char *secret;
	EVP_PKEY *pkey = NULL, *peerkey = NULL, *params = NULL;
	/* NB: assumes pkey, peerkey have been already set up */

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
	/* Get the peer's public key, and provide the peer with our public key -
	 * how this is done will be specific to your circumstances */
	//peerkey = get_peerkey(pkey);

	/* Create the context for the shared secret derivation */
	if(NULL == (ctx = EVP_PKEY_CTX_new(pkey, NULL))) handleErrors();

	/* Initialise */
	if(1 != EVP_PKEY_derive_init(ctx)) handleErrors();

	/* Provide the peer public key */
	if(1 != EVP_PKEY_derive_set_peer(ctx, peerkey)) handleErrors();

	/* Determine buffer length for shared secret */
	if(1 != EVP_PKEY_derive(ctx, NULL, secret_len)) handleErrors();

	/* Create the buffer */
	if(NULL == (secret = OPENSSL_malloc(*secret_len))) handleErrors();

	/* Derive the shared secret */
	if(1 != (EVP_PKEY_derive(ctx, secret, secret_len))) handleErrors();

	EVP_PKEY_CTX_free(ctx);
	EVP_PKEY_free(peerkey);
	EVP_PKEY_free(pkey);
	EVP_PKEY_CTX_free(kctx);
	EVP_PKEY_free(params);
	EVP_PKEY_CTX_free(pctx);

	/* Never use a derived secret directly. Typically it is passed
	 * through some hash function to produce a key */
	return secret;
}

int encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
            unsigned char *iv, unsigned char *ciphertext)
{
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
}

int decrypt(unsigned char *ciphertext, int ciphertext_len, unsigned char *key,
            unsigned char *iv, unsigned char *plaintext)
{
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

    return plaintext_len;
}

int mainA (void)
{
	printf("Hallo ECC\n");
	init_ecdh();
	/* To serialize the public key:

	Pass the EVP_PKEY to EVP_PKEY_get1_EC_KEY() to get an EC_KEY.
	Pass the EC_KEY to EC_KEY_get0_public_key() to get an EC_POINT.
	Pass the EC_POINT to EC_POINT_point2oct() to get octets, which are just unsigned char *.
	 */
	EC_KEY* eckey = NULL;
	//EC_POINT* ecpoint = NULL;
	const EC_GROUP* ecgroup = EC_GROUP_new_by_curve_name(NID_X9_62_prime256v1);
	size_t size = 1000;
	unsigned char pubkey[size];
	unsigned char privatekey[size];

	size_t a;
	BN_CTX* ctx;
	ctx = BN_CTX_new();

	//ecgroup = EC_GROUP_new_by_curve_name(NID_X9_62_prime256v1);
	eckey = EVP_PKEY_get1_EC_KEY(pkey);


	const EC_POINT* ecpoint = EC_KEY_get0_public_key(eckey);
	a = EC_POINT_point2oct(ecgroup ,ecpoint ,EC_GROUP_get_point_conversion_form(ecgroup),pubkey,size,ctx);
	printf("Publickey[%lu]: ",a);
	for(int idx=0;idx<a;idx++){
		printf("%x", pubkey[idx]);
	}
	printf("\n");



	/*	To serialize the private key:
	Pass the EVP_PKEY to EVP_PKEY_get1_EC_KEY() to get an EC_KEY.
	Pass the EC_KEY to EC_KEY_get0_private_key() to get a BIGNUM.
	Pass the BIGNUM to BN_bn2mpi() to get an mpi, which is a format written to unsigned char *.
	 * */
	const BIGNUM* prvKey = EC_KEY_get0_private_key(eckey);
	size_t as = BN_bn2mpi(prvKey,privatekey);
	printf("Privatekey[%lu]: ",as);
	for(int idx=0;idx<as;idx++){
		printf("%x", privatekey[idx]);
	}
	printf("\n");
	/*To deserialize the private key:

	Pass the mpi to BN_mpi2bn() to get a BIGNUM.
	Pass the BIGNUM to EC_KEY_set_private_key() to get an EC_KEY.
	Pass the EC_KEY to EVP_PKEY_set1_EC_KEY to get an EVP_KEY.
	 * */

	/* To deserialize the public key:
		Pass the octets to EC_POINT_oct2point() to get an EC_POINT.
		Pass the EC_POINT to EC_KEY_set_public_key() to get an EC_KEY.
		Pass the EC_KEY to EVP_PKEY_set1_EC_KEY to get an EVP_KEY.
	 */
	EC_POINT* peerpoint;
	EC_KEY* peereckey;
	const EC_GROUP* ecgroupA;// = EC_GROUP_new_by_curve_name(NID_X9_62_prime256v1);

	peereckey = EC_KEY_new_by_curve_name(NID_X9_62_prime256v1);
	ecgroupA = EC_KEY_get0_group(peereckey);
	peerpoint = EC_POINT_new(ecgroup);

	const unsigned char* buf = pubkey;
	size_t buflen = a;
	int b=-5,c=-5,d=-5;

	printf("Publickey[%lu]: ",a);
		for(int idx=0;idx<a;idx++){
			printf("%x", pubkey[idx]);
		}
		printf("\n");
	printf("%d, %d, %d\n",b,c,d);
	b = EC_POINT_hex2point(ecgroupA, buf, peerpoint, NULL);
	printf("%d, %d, %d\n",b,c,d);
	c = EC_KEY_set_public_key(peereckey, peerpoint);
	printf("%d, %d, %d\n",b,c,d);
	peerkey = EVP_PKEY_new();
	d = EVP_PKEY_set1_EC_KEY(peerkey,peereckey);
	printf("%d, %d, %d\n",b,c,d);
}

void nixFct(){
    /*
     * Set up the key and iv. Do I need to say to not hard code these in a
     * real application? :-)
     */

    /* A 128 bit key */
    unsigned char *key = (unsigned char *)"0123456789012345";

    /* A 128 bit IV */
    unsigned char *iv = (unsigned char *)"0123456789012345";

    /* Message to be encrypted */
    unsigned char *plaintext =
        (unsigned char *)"The quick brown fox jumps over the lazy dog";

    /*
     * Buffer for ciphertext. Ensure the buffer is long enough for the
     * ciphertext which may be longer than the plaintext, depending on the
     * algorithm and mode.
     */
    unsigned char ciphertext[128];

    /* Buffer for the decrypted text */
    unsigned char decryptedtext[128];

    int decryptedtext_len, ciphertext_len;

    /* Encrypt the plaintext */
    ciphertext_len = encrypt (plaintext, strlen ((char *)plaintext), key, iv,
                              ciphertext);

    /* Do something useful with the ciphertext here */
    printf("Ciphertext is:\n");
    BIO_dump_fp (stdout, (const char *)ciphertext, ciphertext_len);

    /* Decrypt the ciphertext */
    decryptedtext_len = decrypt(ciphertext, ciphertext_len, key, iv,
                                decryptedtext);

    /* Add a NULL terminator. We are expecting printable text */
    decryptedtext[decryptedtext_len] = '\0';

    /* Show the decrypted text */
    printf("Decrypted text is:\n");
    printf("%s\n", decryptedtext);


    return;// 0;
}

