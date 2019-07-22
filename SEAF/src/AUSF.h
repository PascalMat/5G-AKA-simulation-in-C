/*
 * AUSF.h
 *
 *  Created on: 23.04.2019
 *      Author: pascalmathias
 */

// Includes
#include <stdlib.h>
#include "identifier.h"
#include "av_types.h"
#include "defs.h"

#ifndef AUSF_H_
#define AUSF_H_
// Authenticate request
void ausf_init();
void ausf_close();
void Nausf_UEAuthenticationRequest(se_av_t* se_av, suci_t* suci, sn_name_t* sn_name);
int Nausf_UEAuthenticationResponse(uint8_t* res, supi_t *supi, uint8_t *kseaf);

#endif /* AUSF_H_ */
