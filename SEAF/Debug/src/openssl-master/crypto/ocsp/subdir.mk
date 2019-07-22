################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/ocsp/ocsp_asn.c \
../src/openssl-master/crypto/ocsp/ocsp_cl.c \
../src/openssl-master/crypto/ocsp/ocsp_err.c \
../src/openssl-master/crypto/ocsp/ocsp_ext.c \
../src/openssl-master/crypto/ocsp/ocsp_ht.c \
../src/openssl-master/crypto/ocsp/ocsp_lib.c \
../src/openssl-master/crypto/ocsp/ocsp_prn.c \
../src/openssl-master/crypto/ocsp/ocsp_srv.c \
../src/openssl-master/crypto/ocsp/ocsp_vfy.c \
../src/openssl-master/crypto/ocsp/v3_ocsp.c 

OBJS += \
./src/openssl-master/crypto/ocsp/ocsp_asn.o \
./src/openssl-master/crypto/ocsp/ocsp_cl.o \
./src/openssl-master/crypto/ocsp/ocsp_err.o \
./src/openssl-master/crypto/ocsp/ocsp_ext.o \
./src/openssl-master/crypto/ocsp/ocsp_ht.o \
./src/openssl-master/crypto/ocsp/ocsp_lib.o \
./src/openssl-master/crypto/ocsp/ocsp_prn.o \
./src/openssl-master/crypto/ocsp/ocsp_srv.o \
./src/openssl-master/crypto/ocsp/ocsp_vfy.o \
./src/openssl-master/crypto/ocsp/v3_ocsp.o 

C_DEPS += \
./src/openssl-master/crypto/ocsp/ocsp_asn.d \
./src/openssl-master/crypto/ocsp/ocsp_cl.d \
./src/openssl-master/crypto/ocsp/ocsp_err.d \
./src/openssl-master/crypto/ocsp/ocsp_ext.d \
./src/openssl-master/crypto/ocsp/ocsp_ht.d \
./src/openssl-master/crypto/ocsp/ocsp_lib.d \
./src/openssl-master/crypto/ocsp/ocsp_prn.d \
./src/openssl-master/crypto/ocsp/ocsp_srv.d \
./src/openssl-master/crypto/ocsp/ocsp_vfy.d \
./src/openssl-master/crypto/ocsp/v3_ocsp.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/ocsp/%.o: ../src/openssl-master/crypto/ocsp/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


