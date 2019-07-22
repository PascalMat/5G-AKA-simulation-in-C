################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/pkcs7/bio_pk7.c \
../src/openssl-master/crypto/pkcs7/pk7_asn1.c \
../src/openssl-master/crypto/pkcs7/pk7_attr.c \
../src/openssl-master/crypto/pkcs7/pk7_doit.c \
../src/openssl-master/crypto/pkcs7/pk7_lib.c \
../src/openssl-master/crypto/pkcs7/pk7_mime.c \
../src/openssl-master/crypto/pkcs7/pk7_smime.c \
../src/openssl-master/crypto/pkcs7/pkcs7err.c 

OBJS += \
./src/openssl-master/crypto/pkcs7/bio_pk7.o \
./src/openssl-master/crypto/pkcs7/pk7_asn1.o \
./src/openssl-master/crypto/pkcs7/pk7_attr.o \
./src/openssl-master/crypto/pkcs7/pk7_doit.o \
./src/openssl-master/crypto/pkcs7/pk7_lib.o \
./src/openssl-master/crypto/pkcs7/pk7_mime.o \
./src/openssl-master/crypto/pkcs7/pk7_smime.o \
./src/openssl-master/crypto/pkcs7/pkcs7err.o 

C_DEPS += \
./src/openssl-master/crypto/pkcs7/bio_pk7.d \
./src/openssl-master/crypto/pkcs7/pk7_asn1.d \
./src/openssl-master/crypto/pkcs7/pk7_attr.d \
./src/openssl-master/crypto/pkcs7/pk7_doit.d \
./src/openssl-master/crypto/pkcs7/pk7_lib.d \
./src/openssl-master/crypto/pkcs7/pk7_mime.d \
./src/openssl-master/crypto/pkcs7/pk7_smime.d \
./src/openssl-master/crypto/pkcs7/pkcs7err.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/pkcs7/%.o: ../src/openssl-master/crypto/pkcs7/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


