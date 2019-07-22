################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/dsa/dsa_ameth.c \
../src/openssl-master/crypto/dsa/dsa_asn1.c \
../src/openssl-master/crypto/dsa/dsa_depr.c \
../src/openssl-master/crypto/dsa/dsa_err.c \
../src/openssl-master/crypto/dsa/dsa_gen.c \
../src/openssl-master/crypto/dsa/dsa_key.c \
../src/openssl-master/crypto/dsa/dsa_lib.c \
../src/openssl-master/crypto/dsa/dsa_meth.c \
../src/openssl-master/crypto/dsa/dsa_ossl.c \
../src/openssl-master/crypto/dsa/dsa_pmeth.c \
../src/openssl-master/crypto/dsa/dsa_prn.c \
../src/openssl-master/crypto/dsa/dsa_sign.c \
../src/openssl-master/crypto/dsa/dsa_vrf.c 

OBJS += \
./src/openssl-master/crypto/dsa/dsa_ameth.o \
./src/openssl-master/crypto/dsa/dsa_asn1.o \
./src/openssl-master/crypto/dsa/dsa_depr.o \
./src/openssl-master/crypto/dsa/dsa_err.o \
./src/openssl-master/crypto/dsa/dsa_gen.o \
./src/openssl-master/crypto/dsa/dsa_key.o \
./src/openssl-master/crypto/dsa/dsa_lib.o \
./src/openssl-master/crypto/dsa/dsa_meth.o \
./src/openssl-master/crypto/dsa/dsa_ossl.o \
./src/openssl-master/crypto/dsa/dsa_pmeth.o \
./src/openssl-master/crypto/dsa/dsa_prn.o \
./src/openssl-master/crypto/dsa/dsa_sign.o \
./src/openssl-master/crypto/dsa/dsa_vrf.o 

C_DEPS += \
./src/openssl-master/crypto/dsa/dsa_ameth.d \
./src/openssl-master/crypto/dsa/dsa_asn1.d \
./src/openssl-master/crypto/dsa/dsa_depr.d \
./src/openssl-master/crypto/dsa/dsa_err.d \
./src/openssl-master/crypto/dsa/dsa_gen.d \
./src/openssl-master/crypto/dsa/dsa_key.d \
./src/openssl-master/crypto/dsa/dsa_lib.d \
./src/openssl-master/crypto/dsa/dsa_meth.d \
./src/openssl-master/crypto/dsa/dsa_ossl.d \
./src/openssl-master/crypto/dsa/dsa_pmeth.d \
./src/openssl-master/crypto/dsa/dsa_prn.d \
./src/openssl-master/crypto/dsa/dsa_sign.d \
./src/openssl-master/crypto/dsa/dsa_vrf.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/dsa/%.o: ../src/openssl-master/crypto/dsa/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


