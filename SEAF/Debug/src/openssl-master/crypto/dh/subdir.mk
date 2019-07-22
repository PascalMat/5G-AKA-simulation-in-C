################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/dh/dh_ameth.c \
../src/openssl-master/crypto/dh/dh_asn1.c \
../src/openssl-master/crypto/dh/dh_check.c \
../src/openssl-master/crypto/dh/dh_depr.c \
../src/openssl-master/crypto/dh/dh_err.c \
../src/openssl-master/crypto/dh/dh_gen.c \
../src/openssl-master/crypto/dh/dh_kdf.c \
../src/openssl-master/crypto/dh/dh_key.c \
../src/openssl-master/crypto/dh/dh_lib.c \
../src/openssl-master/crypto/dh/dh_meth.c \
../src/openssl-master/crypto/dh/dh_pmeth.c \
../src/openssl-master/crypto/dh/dh_prn.c \
../src/openssl-master/crypto/dh/dh_rfc5114.c \
../src/openssl-master/crypto/dh/dh_rfc7919.c 

OBJS += \
./src/openssl-master/crypto/dh/dh_ameth.o \
./src/openssl-master/crypto/dh/dh_asn1.o \
./src/openssl-master/crypto/dh/dh_check.o \
./src/openssl-master/crypto/dh/dh_depr.o \
./src/openssl-master/crypto/dh/dh_err.o \
./src/openssl-master/crypto/dh/dh_gen.o \
./src/openssl-master/crypto/dh/dh_kdf.o \
./src/openssl-master/crypto/dh/dh_key.o \
./src/openssl-master/crypto/dh/dh_lib.o \
./src/openssl-master/crypto/dh/dh_meth.o \
./src/openssl-master/crypto/dh/dh_pmeth.o \
./src/openssl-master/crypto/dh/dh_prn.o \
./src/openssl-master/crypto/dh/dh_rfc5114.o \
./src/openssl-master/crypto/dh/dh_rfc7919.o 

C_DEPS += \
./src/openssl-master/crypto/dh/dh_ameth.d \
./src/openssl-master/crypto/dh/dh_asn1.d \
./src/openssl-master/crypto/dh/dh_check.d \
./src/openssl-master/crypto/dh/dh_depr.d \
./src/openssl-master/crypto/dh/dh_err.d \
./src/openssl-master/crypto/dh/dh_gen.d \
./src/openssl-master/crypto/dh/dh_kdf.d \
./src/openssl-master/crypto/dh/dh_key.d \
./src/openssl-master/crypto/dh/dh_lib.d \
./src/openssl-master/crypto/dh/dh_meth.d \
./src/openssl-master/crypto/dh/dh_pmeth.d \
./src/openssl-master/crypto/dh/dh_prn.d \
./src/openssl-master/crypto/dh/dh_rfc5114.d \
./src/openssl-master/crypto/dh/dh_rfc7919.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/dh/%.o: ../src/openssl-master/crypto/dh/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


