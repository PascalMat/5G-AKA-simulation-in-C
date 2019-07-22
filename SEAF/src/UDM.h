/*
 * UDM.h
 *
 *  Created on: 23.04.2019
 *      Author: pascalmathias
 */

#ifndef UDM_H_
#define UDM_H_

#include "identifier.h"
#include "av_types.h"
#include "defs.h"


void udm_init();
void udm_close();
void Nudm_UEAuthenticationRequest(he_av_t* av, suci_t* suci, sn_name_t* sn_name);
void Nudm_AuthenticationSuccessful();
#endif /* UDM_H_ */
