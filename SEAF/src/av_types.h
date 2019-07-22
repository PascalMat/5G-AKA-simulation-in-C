/*
 ============================================================================
 Name        : av_types.h
 Author      : Pascal Mathias
 Version     : 0.1
 Copyright   : This application is part of my master thesis
 Description : Identifier used for 5G-AKA
 ============================================================================
 */

#ifndef AV_TYPES_H_
#define AV_TYPES_H_

#include <stdlib.h>

typedef struct{
	uint8_t method;
	uint8_t rand[16];
	uint8_t autn[16];
	uint8_t hxres_star[32]; 	// Größe nicht geprüft
	uint8_t k_seaf[32];			// Größe nicht geprüft
	supi_t supi;
}av_t;

typedef struct{
	uint8_t rand[16];
	uint8_t autn[16];
	uint8_t hxres_star[32];
}se_av_t;

typedef struct{
	uint8_t method;
	uint8_t rand[16];
	uint8_t autn[16];
	uint8_t xres_star[32];
	uint8_t k_ausf[32];
	supi_t supi;
}he_av_t;

#endif /* AV_TYPES_ */
