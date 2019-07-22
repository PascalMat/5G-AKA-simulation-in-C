/*
 * USIM.c
 *
 *  Created on: 19.04.2019
 *      Author: pascalmathias
 */

#include "USIM.h"
#include <sys/socket.h>
#include <netinet/in.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/ec.h>
#include <openssl/err.h>
#include <openssl/sha.h>
#include <openssl/rsa.h>
#include "ffunction.h"
#include "defs.h"

#define CL_PORT 51111
#define SV_PORT 50001
#define BUFSIZE 2048

static size_t sizeHNPK = 65;
static unsigned char homeNetworkPublicKey[65];
const int hashmaxlen = 256;
static supi_t supi;
static uint8_t key_k[SIZE_K];
static uint8_t sqn_ue[6];

void handleErrors(void)
{
	ERR_print_errors_fp(stderr);
    abort();
}

void initUSIM(){
#ifdef showmethod
	printf("USIM: initUSIM\n");
#endif
	for(int idx= 0; idx < 3;idx++){
		supi.mcc_mnc[idx] = 0;
	}
	for(int idx= 0; idx < 5;idx++){
		supi.msin[idx] = 0;
	}
	for(int idx= 0; idx < SIZE_K;idx++){
		key_k[idx] = 0;
	}
	for(int idx= 0; idx < 6;idx++){
		sqn_ue[idx] = 0;
	}
	get_HomeNetworkPublicKey("127.0.0.1");

}

int get_HomeNetworkPublicKey(char *servAddr){
#ifdef showmethod
	printf("USIM: get_HomeNetworkPublicKey\n");
#endif
	// create client socket
	struct sockaddr_in clAddr;
	struct sockaddr_in seafAddr;
	socklen_t addrlen = sizeof(seafAddr);
	int cl, recvlen;
	int  slen=sizeof(seafAddr);
	unsigned char buf[BUFSIZE];
	char *server ="127.0.0.1";

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
	if (inet_aton(servAddr, &seafAddr.sin_addr)==0) {
		fprintf(stderr, "inet_aton() failed\n");
		exit(1);
	}

	sprintf(buf, "getHNPK");
	if(sendto(cl, buf, strlen(buf), 0,(struct sockaddr *)&seafAddr, slen)==-1){
		perror("sendto");
		exit(1);
	}

	// get public key
	recvlen = recvfrom(cl, buf, BUFSIZE, 0, (struct sockaddr *)&seafAddr, &slen);
	if(recvlen>=0){
		buf[recvlen]=0;
		memcpy(homeNetworkPublicKey, buf, recvlen);
		//printf("Msg[%d]: \t%s \n", recvlen, buf);
	}
	// close client-socket
	close(cl);

	return 1;
}

/*EVP_PKEY* get_peerkey(EVP_PKEY* keys) // it contains public + private
{
	int len = 0;
	unsigned char *buf = NULL, *p;
	const unsigned char *p2;
	EVP_PKEY* pkey;

	len = i2d_PUBKEY(keys, NULL); // find out required buffer length
	buf = (unsigned char*) OPENSSL_malloc(len); //allocate
	p = buf;
	len = i2d_PUBKEY(keys, &p);

	p2 = buf;
	pkey = d2i_PUBKEY(NULL, &p2, len);
	if (pkey == NULL) {
		fprintf(stderr, "d2i_PUBKEY failed\n");
	}
	OPENSSL_free(buf);

	return pkey;
}
*/
unsigned char* getSharedSecret(size_t *secret_len, suci_t *suci_ecc){
#ifdef showmethod
	printf("USIM: getSharedSecret\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

	EVP_PKEY_CTX *pctx, *kctx;
	EVP_PKEY_CTX *ctx;
	unsigned char *secret;
	EVP_PKEY *pkey = NULL, *peerkey = NULL, *params = NULL;
	size_t secretLength;
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

	// Put public key in suci-struct
	EC_KEY* eckey = NULL;
	//EC_POINT* ecpoint = NULL;
	const EC_GROUP* ecgroup_pk = EC_GROUP_new_by_curve_name(NID_X9_62_prime256v1);
	size_t size = 1000;
	unsigned char suci_pubkey[size];


	size_t a;
	BN_CTX* pkctx;

	pkctx = BN_CTX_new();

	//ecgroup = EC_GROUP_new_by_curve_name(NID_X9_62_prime256v1);
	eckey = EVP_PKEY_get1_EC_KEY(pkey);


	const EC_POINT* ecpoint = EC_KEY_get0_public_key(eckey);
	a = EC_POINT_point2oct(ecgroup_pk ,ecpoint ,EC_GROUP_get_point_conversion_form(ecgroup_pk),suci_pubkey,size,pkctx);
#ifdef testb
	printf("Publickey[%lu]: ",a);
	for(int idx=0;idx<a;idx++){
		printf("%x", suci_pubkey[idx]);
	}
	printf("\n");
#endif
	memcpy(suci_ecc->ecc_pub_key, suci_pubkey, a);

	/* Get the peer's public key, and provide the peer with our public key -
	 * how this is done will be specific to your circumstances */
	//peerkey = get_peerkey(pkey);
	EC_POINT* peerpoint;
	EC_KEY* peereckey;

	const EC_GROUP* ecgroup;// = EC_GROUP_new_by_curve_name(NID_X9_62_prime256v1);

	peereckey = EC_KEY_new_by_curve_name(NID_X9_62_prime256v1);
	ecgroup = EC_KEY_get0_group(peereckey);
	peerpoint = EC_POINT_new(ecgroup);
	const unsigned char* buf = homeNetworkPublicKey;
	int b=-5,c=-5,d=-5;
#ifdef testb
	printf("HomeNetworkPublicKey[%lu]: ",sizeHNPK);
		for(int idx=0;idx<sizeHNPK;idx++){
			printf("%x", homeNetworkPublicKey[idx]);
		}
		printf("\n");
#endif
	b = EC_POINT_oct2point(ecgroup, peerpoint, buf,65, NULL);
	c = EC_KEY_set_public_key(peereckey, peerpoint);
	peerkey = EVP_PKEY_new();
	d = EVP_PKEY_set1_EC_KEY(peerkey,peereckey);

	//peerkey = get_peerkey(peerkey);

	/* Create the context for the shared secret derivation */
	if(NULL == (ctx = EVP_PKEY_CTX_new(pkey, NULL))) handleErrors();
	/* Initialise */
	if(1 != EVP_PKEY_derive_init(ctx)) handleErrors();
	/* Provide the peer public key */
	if(1 != EVP_PKEY_derive_set_peer(ctx, peerkey)) handleErrors();
	/* Determine buffer length for shared secret */
	if(1 != EVP_PKEY_derive(ctx, NULL, &secretLength)) handleErrors();
	/* Create the buffer */
	if(NULL == (secret = OPENSSL_malloc(secretLength))) handleErrors();
	/*for(int i=0; i<secret_len;i++){
		printf("%x", secret[i]);
	}*/
	/* Derive the shared secret */

	int e = EVP_PKEY_derive(ctx, secret, &secretLength);
	//if(1 != (e)) handleErrors();

	EVP_PKEY_CTX_free(ctx);
	EVP_PKEY_free(peerkey);
	EVP_PKEY_free(pkey);
	EVP_PKEY_CTX_free(kctx);
	EVP_PKEY_free(params);
	EVP_PKEY_CTX_free(pctx);
	/* Never use a derived secret directly. Typically it is passed
	 * through some hash function to produce a key */
	*secret_len = secretLength;

	//TODO: sharedsecret doesn't work -> fixed secret
	/*for(int cnt=0; cnt<secretLength;cnt++){
		secret[cnt] = '0';
	}*/

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("getSharedSecret Duration %lu\n",z-y);
#endif
	return secret;
}

void kdf(unsigned char *sharedSecret, uint8_t sslen, size_t* keydatalen, char *sharedinfo, uint8_t silen, unsigned char* key){
	//SEC 1: Elliptic Curve Cryptography, 3.6.1
#ifdef showmethod
	printf("USIM: kdf\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

#ifdef testb
	puts("sharedSecret:");
	for(int i=0; i<sslen;i++){
			printf("%X",sharedSecret[i]);
		}
	printf("\n");
#endif
	int hashlen = sslen + silen + 4;
	int i;
//	printf("%d : %d\n",hashlen, hashmaxlen);
//	printf("%d : %d\n",sslen, silen);
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
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("kdf Duration %lu\n",z-y);
#endif
}

int encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
            unsigned char *iv, unsigned char *ciphertext)
{
#ifdef showmethod
	printf("USIM: encrypt\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

    EVP_CIPHER_CTX *ctx;

    int len;

    int ciphertext_len;

    /* Create and initialise the context */
    if(!(ctx = EVP_CIPHER_CTX_new()))
        handleErrors();
#ifdef testb
	printf("plaintext length: %d\n", plaintext_len);
#endif
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

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("encrypt Duration %lu\n",z-y);
#endif
    return ciphertext_len;
}

int decrypt(unsigned char *ciphertext, int ciphertext_len, unsigned char *key,
            unsigned char *iv, unsigned char *plaintext)
{
#ifdef showmethod
	printf("USIM: decrypt\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
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
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("decrypt Duration %lu\n",z-y);
#endif
    return plaintext_len;
}

void get_SUCI(suci_t *suci){
#ifdef showmethod
	printf("USIM: get_SUCI\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

	// create Keypair & get sharedsecret
	unsigned char* sharedSecret;
	unsigned char key[128],suci_tmp[128];
	size_t secretlen, keylen=128, cipherlen;
	sharedSecret = getSharedSecret(&secretlen, suci);
#ifdef testb
	puts("shared Secret:");
	for(int i=0; i<secretlen;i++){
		printf("%X",sharedSecret[i]);
	}
	puts("\n");
	printf("secretlen: %d\n", secretlen);
#endif
	// get key
	kdf(sharedSecret, secretlen, &keylen, NULL, 0, &key);

	// encrypt
	unsigned char *supi_tmp ;
#ifdef testb
	printf("SUPI.msin size: %d\n", sizeof(supi.msin));
	for(int i=0; i<sizeof(supi.msin);i++){
		printf("%x",supi.msin[i]);
	}
	printf("\n");
#endif
	supi_tmp = (unsigned char*)supi.msin;
	// TODO: generated key not used, instead fixed sharedsecret
	cipherlen= encrypt(supi_tmp,sizeof(supi_tmp), key, NULL,  suci_tmp);
//	printf("Ciphertext[%d] is:\n", cipherlen);
	BIO_dump_fp (stdout, (const char *)suci_tmp, cipherlen);

//	printf("SUCI.msin:");
	for(int i=0; i<cipherlen;i++){
//		printf("%x",suci_tmp[i]);
		suci->msin[i]= (uint8_t)suci_tmp[i];
	}
//	printf("\n");

	//memcpy(suci->msin, suci_tmp, 5);
	for(int i=0; i<sizeof(suci->msin);i++){
//		printf("%x",suci->msin[i]);
	}
//	printf("\n");
	//memcpy(suci->mcc_mnc, supi.mcc_mnc, 3);
	for(int i=0; i<sizeof(suci->mcc_mnc);i++){
		suci->mcc_mnc[i] = supi.mcc_mnc[i];
//		printf("%x",suci->mcc_mnc[i]);

	}
//  	printf("\n");
	//suci_tmp to suci_t


#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("get_Suci Duration %lu\n",z-y);
#endif

}
int autnIsAccepted(uint8_t autn[16], uint8_t rand[16]){
#ifdef showmethod
	printf("USIM: authIsAccepted\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

	uint8_t amf[2] = {0x80,0x00};
	uint8_t mac_a[8], mac_p[8]; // MAC from AUTN and Proving-MAC
	uint8_t ak[6];
	uint8_t res[8], ck[16], ik[16];

// Check SQN
	//  Compute AK and extract SQN
	f2345(key_k, rand, res, ck, ik, ak);
	uint8_t sqn[6];

	for(int i = 0; i<6;i++){
		sqn[i] = autn[i] ^ ak[i];
	}

	for(int i=5; i>=0;i--){
		if(sqn[i] < sqn_ue[i]){
			printf("SQN not accepted");
			return 0;
		}
	}

// Check MAC
	// Extract MAC from AUTN

	for(int i=8; i<16; i++){
		mac_a[i-8]= autn[i];
	}
#ifdef test
	printf("\t MAC_a: ");
		for(int i = 0; i<8;i++){
			printf("%x",mac_a[i]);
		}
		printf("\n");
#endif
	f1(key_k, rand, sqn, amf, &mac_p);
#ifdef test
	printf("\t MAC_p: ");
		for(int i = 0; i<8;i++){
			printf("%x",mac_p[i]);
		}
		printf("\n");
		printf("%d\n", memcmp(mac_a, mac_p, 8));
#endif
	if(memcmp(mac_a, mac_p, 8)!=0){
		printf("MAC not accepted");
		return 0;
	}


#ifdef testb
	printf("USIM: Autn\n");
	printf("\t AK: ");
	for(int i = 0; i<6;i++){
		printf("%x",ak[i]);
	}
	printf("\n");
	printf("\t K: ");
	for(int i = 0; i<SIZE_K;i++){
		printf("%x",key_k[i]);
	}
	printf("\n");
	printf("\t SQN: ");
	for(int i = 0; i<6;i++){
		printf("%x",sqn[i]);
	}
	printf("\n");
#endif

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("autnIsAccepted Duration %lu\n",z-y);
#endif
	return 1;
}

void computeRES(uint8_t autn[16], uint8_t rand[16],uint8_t res[8], uint8_t ck[16],uint8_t ik[16]){
#ifdef showmethod
	printf("USIM: computeRes\n");
#endif
#ifdef measurefct
	uint64_t y,z;
	y=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
#endif

	uint8_t ak[6];
	f2345(key_k, rand, res, ck, ik, ak);
#ifdef testb
	printf("USIM: Autn\n");
	printf("\t AK: ");
	for(int i = 0; i<6;i++){
		printf("%x",ak[i]);
	}
	printf("\n");
	printf("\t IK: ");
	for(int i = 0; i<16;i++){
		printf("%x",ik[i]);
	}
	printf("\n");
	printf("\t CK: ");
	for(int i = 0; i<16;i++){
		printf("%x",ck[i]);
	}
	printf("\n");
	printf("\t RES: ");
	for(int i = 0; i<8;i++){
		printf("%x",res[i]);
	}
	printf("\n");

#endif

#ifdef measurefct
	z=clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID);
	//printf("T: %lu \n",clock_gettime_nsec_np(CLOCK_PROCESS_CPUTIME_ID));
	printf("A: %lu \n",y);
	printf("B: %lu \n",z);
	printf("computeRES Duration %lu\n",z-y);
#endif
}
