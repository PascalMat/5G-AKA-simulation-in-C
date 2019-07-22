################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/fuzz/asn1.c \
../src/openssl-master/fuzz/asn1parse.c \
../src/openssl-master/fuzz/bignum.c \
../src/openssl-master/fuzz/bndiv.c \
../src/openssl-master/fuzz/client.c \
../src/openssl-master/fuzz/cms.c \
../src/openssl-master/fuzz/conf.c \
../src/openssl-master/fuzz/crl.c \
../src/openssl-master/fuzz/ct.c \
../src/openssl-master/fuzz/driver.c \
../src/openssl-master/fuzz/server.c \
../src/openssl-master/fuzz/test-corpus.c \
../src/openssl-master/fuzz/x509.c 

OBJS += \
./src/openssl-master/fuzz/asn1.o \
./src/openssl-master/fuzz/asn1parse.o \
./src/openssl-master/fuzz/bignum.o \
./src/openssl-master/fuzz/bndiv.o \
./src/openssl-master/fuzz/client.o \
./src/openssl-master/fuzz/cms.o \
./src/openssl-master/fuzz/conf.o \
./src/openssl-master/fuzz/crl.o \
./src/openssl-master/fuzz/ct.o \
./src/openssl-master/fuzz/driver.o \
./src/openssl-master/fuzz/server.o \
./src/openssl-master/fuzz/test-corpus.o \
./src/openssl-master/fuzz/x509.o 

C_DEPS += \
./src/openssl-master/fuzz/asn1.d \
./src/openssl-master/fuzz/asn1parse.d \
./src/openssl-master/fuzz/bignum.d \
./src/openssl-master/fuzz/bndiv.d \
./src/openssl-master/fuzz/client.d \
./src/openssl-master/fuzz/cms.d \
./src/openssl-master/fuzz/conf.d \
./src/openssl-master/fuzz/crl.d \
./src/openssl-master/fuzz/ct.d \
./src/openssl-master/fuzz/driver.d \
./src/openssl-master/fuzz/server.d \
./src/openssl-master/fuzz/test-corpus.d \
./src/openssl-master/fuzz/x509.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/fuzz/%.o: ../src/openssl-master/fuzz/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


