/*
 * connection_config.h
 *
 *  Created on: 19.04.2019
 *      Author: pascalmathias
 */

#ifndef CONNECTION_CONFIG_H_
#define CONNECTION_CONFIG_H_



#endif /* CONNECTION_CONFIG_H_ */

enum conn_typ {UDP, TCP};

#define NUMOFCONN 1;

// Connections
#define C_NAME[NUMOFCONN] {"N1_toSeaf"};
#define C_TYPE[NUMOFCONN] {UDP};
#define C_ADDR[NUMOFCONN] {"123.456.789.000"};
#define C_PORT[NUMOFCONN] {50001};
