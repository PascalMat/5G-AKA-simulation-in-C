/*
 ============================================================================
 Name        : identifier.h
 Author      : Pascal Mathias
 Version     : 0.1
 Copyright   : This application is part of my master thesis
 Description : Identifier used for 5G-AKA
 ============================================================================
 */

#ifndef IDENTIFIER_H_
#define IDENTIFIER_H_

#include <stdlib.h>

#define SIZE_SUPI_BYTE 7 // Maximum 60 bits
#define SIZE_SUCI_BYTE 7 //
#define SIZE_GUTI_BYTE 7 //
#define SIZE_SN_NAME 1020 // Maximum 1020 octets (TS24.501, 9.11.1)
#define SIZE_K 16 // in Byte. Should be 128 bits (16) or 256 bits (32)

//typedef uint8_t supi_t[SIZE_SUPI_BYTE];
//typedef uint8_t suci_t[SIZE_SUCI_BYTE];
typedef uint8_t guti_5G_t[SIZE_GUTI_BYTE];
typedef char sn_name_t[SIZE_SN_NAME];

typedef struct {
	uint8_t mcc_mnc[3];
	uint8_t msin[8];
	uint8_t ecc_pub_key[65]; //Größe
} suci_t;

typedef struct {
	uint8_t mcc_mnc[3];
	uint8_t msin[5];
} supi_t;

#endif /* IDENTIFIER_H_ */
