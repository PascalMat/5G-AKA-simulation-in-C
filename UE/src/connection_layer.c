/*
 * connection_layer.c
 *
 *  Created on: 19.04.2019
 *      Author: pascalmathias
 */


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <netdb.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include "connection_layer.h"
#include <arpa/inet.h>


#define UDP 0
#define TCP 1

#ifdef CLIENT
#define CL_NAME "N1_toSeaf"
#define CL_TYPE UDP
#define CL_ADDR "127.0.0.1"
#define CL_PORT 50001
#endif

#ifdef SERVER
#define SV_NAME	"N1_toSeaf"
#define SV_TYPE UDP
//#define SV_ADDR "127.0.0.1"
#define SV_PORT	50001
#define BUFSIZE 2048
#endif

#ifdef CLIENT
int fd_client;  /* fd is the file descriptor for the connected socket */

/* conn: connect to the service running on host:port */
/* return 0 on failure, non-zero on success */
int conn()
{
	unsigned int alen;	/* address length when we get the port number */
	struct sockaddr_in myaddr;	/* our address */
	struct sockaddr_in servaddr;	/* server address */

	/* get a tcp/ip socket */
	/* We do this as we did it for the server */
	/* request the Internet address protocol */
	/* and a reliable 2-way byte stream */
	switch(CL_TYPE){
		case 0: {
			if ((fd_client = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
					perror("cannot create socket");
					return 0;
				}
			break;
		}
		case 1: {
			if ((fd_client = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
				perror("cannot create socket");
				return 0;
			}
			break;
		}
	}
	/* bind to an arbitrary return address */
	/* because this is the client side, we don't care about the */
	/* address since no application will connect here  --- */
	/* INADDR_ANY is the IP address and 0 is the socket */
	/* htonl converts a long integer (e.g. address) to a network */
	/* representation (agreed-upon byte ordering */

	memset((char *)&myaddr, 0, sizeof(myaddr));
	myaddr.sin_family = AF_INET;
	myaddr.sin_addr.s_addr = htonl(INADDR_ANY);
	myaddr.sin_port = htons(CL_PORT);

	if (bind(fd_client, (struct sockaddr *)&myaddr, sizeof(myaddr)) < 0) {
		perror("bind failed");
		return 0;
	}

	/* this part is for debugging only - get the port # that the operating */
	/* system allocated for us. */
        alen = sizeof(myaddr);
        if (getsockname(fd_client, (struct sockaddr *)&myaddr, &alen) < 0) {
                perror("getsockname failed");
                return 0;
        }
	printf("local port number = %d\n", ntohs(myaddr.sin_port));

	/* fill in the server's address and data */
	/* htons() converts a short integer to a network representation */

	memset((char*)&servaddr, 0, sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons(CL_PORT);
	if (inet_aton(CL_ADDR, &servaddr.sin_addr)==0) {
			perror("inet_aton() failed\n");
			exit(1);
		}
	/* connect to server */
	if (connect(fd_client, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
		perror("connect failed");
		return 0;
	}
	return 1;
}

/* disconnect from the service */
void disconn(void)
{
	printf("disconn()\n");
	shutdown(fd_client, 2);    /* 2 means future sends & receives are disallowed */
}
#endif


#ifdef SERVER
void server()
{
	int svc;        /* listening socket providing service */
	int rqst;       /* socket accepting the request */
	socklen_t alen;       /* length of address structure */
	struct sockaddr_in my_addr;    /* address of this service */
	int sockoptval = 1;

	//gethostname(hostname, 128);

	/* get a tcp/ip socket */
	/*   AF_INET is the Internet address (protocol) family  */
	/*   with SOCK_STREAM we ask for a sequenced, reliable, two-way */
	/*   conenction based on byte streams.  With IP, this means that */
	/*   TCP will be used */
	switch(SV_TYPE){
	case 0:{
		if ((svc = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
			perror("cannot create socket");
			exit(1);
		}
		break;
	}
	case 1:{
			if ((svc = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
				perror("cannot create socket");
				exit(1);
			}
			break;
		}
	}

	/* we use setsockopt to set SO_REUSEADDR. This allows us */
	/* to reuse the port immediately as soon as the service exits. */
	/* Some operating systems will not allow immediate reuse */
	/* on the chance that some packets may still be en route */
	/* to the port. */

	setsockopt(svc, SOL_SOCKET, SO_REUSEADDR, &sockoptval, sizeof(int));

	/* set up our address */
	/* htons converts a short integer into the network representation */
	/* htonl converts a long integer into the network representation */
	/* INADDR_ANY is the special IP address 0.0.0.0 which binds the */
	/* transport endpoint to all IP addresses on the machine. */

	memset((char*)&my_addr, 0, sizeof(my_addr));  /* 0 out the structure */
	my_addr.sin_family = AF_INET;   /* address family */
	my_addr.sin_port = htons(SV_PORT);
	my_addr.sin_addr.s_addr = htonl(INADDR_ANY);

	/* bind to the address to which the service will be offered */
	if (bind(svc, (struct sockaddr *)&my_addr, sizeof(my_addr)) < 0) {
		perror("bind failed");
		exit(1);
	}

	/* set up the socket for listening with a queue length of 5 */
	if (listen(svc, 5) < 0) {
		perror("listen failed");
		exit(1);
	}

	printf("server started on %s, listening on port\n", SV_PORT);

// start recv in a thread

}

void *recv_thread(int fd) {
	struct sockaddr_in recvaddr;
	int recvlen;
	unsigned char buf[BUFSIZE];

	for (;;) {
			printf("waiting on port %d\n", SV_PORT);
			recvlen = recvfrom(fd, buf, BUFSIZE, 0, (struct sockaddr *)&recvaddr, &addrlen);
			if (recvlen > 0) {
				buf[recvlen] = 0;
				printf("received message: \"%s\" (%d bytes)\n", buf, recvlen);
			}
			else
				printf("uh oh - something went wrong!\n");
			sprintf(buf, "ack %d", msgcnt++);
			printf("sending response \"%s\"\n", buf);
			if (sendto(fd, buf, strlen(buf), 0, (struct sockaddr *)&remaddr, addrlen) < 0)
				perror("sendto");
		}
return;
}

#endif
