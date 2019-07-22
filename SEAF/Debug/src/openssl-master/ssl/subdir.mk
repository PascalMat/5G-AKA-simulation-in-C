################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/ssl/bio_ssl.c \
../src/openssl-master/ssl/d1_lib.c \
../src/openssl-master/ssl/d1_msg.c \
../src/openssl-master/ssl/d1_srtp.c \
../src/openssl-master/ssl/methods.c \
../src/openssl-master/ssl/packet.c \
../src/openssl-master/ssl/pqueue.c \
../src/openssl-master/ssl/s3_cbc.c \
../src/openssl-master/ssl/s3_enc.c \
../src/openssl-master/ssl/s3_lib.c \
../src/openssl-master/ssl/s3_msg.c \
../src/openssl-master/ssl/ssl_asn1.c \
../src/openssl-master/ssl/ssl_cert.c \
../src/openssl-master/ssl/ssl_ciph.c \
../src/openssl-master/ssl/ssl_conf.c \
../src/openssl-master/ssl/ssl_err.c \
../src/openssl-master/ssl/ssl_init.c \
../src/openssl-master/ssl/ssl_lib.c \
../src/openssl-master/ssl/ssl_mcnf.c \
../src/openssl-master/ssl/ssl_rsa.c \
../src/openssl-master/ssl/ssl_sess.c \
../src/openssl-master/ssl/ssl_stat.c \
../src/openssl-master/ssl/ssl_txt.c \
../src/openssl-master/ssl/ssl_utst.c \
../src/openssl-master/ssl/t1_enc.c \
../src/openssl-master/ssl/t1_lib.c \
../src/openssl-master/ssl/t1_trce.c \
../src/openssl-master/ssl/tls13_enc.c \
../src/openssl-master/ssl/tls_srp.c 

OBJS += \
./src/openssl-master/ssl/bio_ssl.o \
./src/openssl-master/ssl/d1_lib.o \
./src/openssl-master/ssl/d1_msg.o \
./src/openssl-master/ssl/d1_srtp.o \
./src/openssl-master/ssl/methods.o \
./src/openssl-master/ssl/packet.o \
./src/openssl-master/ssl/pqueue.o \
./src/openssl-master/ssl/s3_cbc.o \
./src/openssl-master/ssl/s3_enc.o \
./src/openssl-master/ssl/s3_lib.o \
./src/openssl-master/ssl/s3_msg.o \
./src/openssl-master/ssl/ssl_asn1.o \
./src/openssl-master/ssl/ssl_cert.o \
./src/openssl-master/ssl/ssl_ciph.o \
./src/openssl-master/ssl/ssl_conf.o \
./src/openssl-master/ssl/ssl_err.o \
./src/openssl-master/ssl/ssl_init.o \
./src/openssl-master/ssl/ssl_lib.o \
./src/openssl-master/ssl/ssl_mcnf.o \
./src/openssl-master/ssl/ssl_rsa.o \
./src/openssl-master/ssl/ssl_sess.o \
./src/openssl-master/ssl/ssl_stat.o \
./src/openssl-master/ssl/ssl_txt.o \
./src/openssl-master/ssl/ssl_utst.o \
./src/openssl-master/ssl/t1_enc.o \
./src/openssl-master/ssl/t1_lib.o \
./src/openssl-master/ssl/t1_trce.o \
./src/openssl-master/ssl/tls13_enc.o \
./src/openssl-master/ssl/tls_srp.o 

C_DEPS += \
./src/openssl-master/ssl/bio_ssl.d \
./src/openssl-master/ssl/d1_lib.d \
./src/openssl-master/ssl/d1_msg.d \
./src/openssl-master/ssl/d1_srtp.d \
./src/openssl-master/ssl/methods.d \
./src/openssl-master/ssl/packet.d \
./src/openssl-master/ssl/pqueue.d \
./src/openssl-master/ssl/s3_cbc.d \
./src/openssl-master/ssl/s3_enc.d \
./src/openssl-master/ssl/s3_lib.d \
./src/openssl-master/ssl/s3_msg.d \
./src/openssl-master/ssl/ssl_asn1.d \
./src/openssl-master/ssl/ssl_cert.d \
./src/openssl-master/ssl/ssl_ciph.d \
./src/openssl-master/ssl/ssl_conf.d \
./src/openssl-master/ssl/ssl_err.d \
./src/openssl-master/ssl/ssl_init.d \
./src/openssl-master/ssl/ssl_lib.d \
./src/openssl-master/ssl/ssl_mcnf.d \
./src/openssl-master/ssl/ssl_rsa.d \
./src/openssl-master/ssl/ssl_sess.d \
./src/openssl-master/ssl/ssl_stat.d \
./src/openssl-master/ssl/ssl_txt.d \
./src/openssl-master/ssl/ssl_utst.d \
./src/openssl-master/ssl/t1_enc.d \
./src/openssl-master/ssl/t1_lib.d \
./src/openssl-master/ssl/t1_trce.d \
./src/openssl-master/ssl/tls13_enc.d \
./src/openssl-master/ssl/tls_srp.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/ssl/%.o: ../src/openssl-master/ssl/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


