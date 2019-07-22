/*
 * USIM.h
 *
 *  Created on: 19.04.2019
 *      Author: pascalmathias
 */

#include "identifier.h"

#ifndef USIM_H_
#define USIM_H_


static sn_name_t sn_name_home = "5G:NTNUnet";

void initUSIM();
void get_SUCI(suci_t *suci);
int get_HomeNetworkPublicKey(char *servAddr);
int autnIsAccepted(uint8_t autn[16], uint8_t rand[16]);
void computeRES(uint8_t autn[16], uint8_t rand[16],uint8_t res[8], uint8_t ck[16],uint8_t ik[16]);

#endif /* USIM_H_ */


