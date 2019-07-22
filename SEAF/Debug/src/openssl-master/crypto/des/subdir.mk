################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/des/cbc_cksm.c \
../src/openssl-master/crypto/des/cbc_enc.c \
../src/openssl-master/crypto/des/cfb64ede.c \
../src/openssl-master/crypto/des/cfb64enc.c \
../src/openssl-master/crypto/des/cfb_enc.c \
../src/openssl-master/crypto/des/des_enc.c \
../src/openssl-master/crypto/des/ecb3_enc.c \
../src/openssl-master/crypto/des/ecb_enc.c \
../src/openssl-master/crypto/des/fcrypt.c \
../src/openssl-master/crypto/des/fcrypt_b.c \
../src/openssl-master/crypto/des/ncbc_enc.c \
../src/openssl-master/crypto/des/ofb64ede.c \
../src/openssl-master/crypto/des/ofb64enc.c \
../src/openssl-master/crypto/des/ofb_enc.c \
../src/openssl-master/crypto/des/pcbc_enc.c \
../src/openssl-master/crypto/des/qud_cksm.c \
../src/openssl-master/crypto/des/rand_key.c \
../src/openssl-master/crypto/des/set_key.c \
../src/openssl-master/crypto/des/str2key.c \
../src/openssl-master/crypto/des/xcbc_enc.c 

OBJS += \
./src/openssl-master/crypto/des/cbc_cksm.o \
./src/openssl-master/crypto/des/cbc_enc.o \
./src/openssl-master/crypto/des/cfb64ede.o \
./src/openssl-master/crypto/des/cfb64enc.o \
./src/openssl-master/crypto/des/cfb_enc.o \
./src/openssl-master/crypto/des/des_enc.o \
./src/openssl-master/crypto/des/ecb3_enc.o \
./src/openssl-master/crypto/des/ecb_enc.o \
./src/openssl-master/crypto/des/fcrypt.o \
./src/openssl-master/crypto/des/fcrypt_b.o \
./src/openssl-master/crypto/des/ncbc_enc.o \
./src/openssl-master/crypto/des/ofb64ede.o \
./src/openssl-master/crypto/des/ofb64enc.o \
./src/openssl-master/crypto/des/ofb_enc.o \
./src/openssl-master/crypto/des/pcbc_enc.o \
./src/openssl-master/crypto/des/qud_cksm.o \
./src/openssl-master/crypto/des/rand_key.o \
./src/openssl-master/crypto/des/set_key.o \
./src/openssl-master/crypto/des/str2key.o \
./src/openssl-master/crypto/des/xcbc_enc.o 

C_DEPS += \
./src/openssl-master/crypto/des/cbc_cksm.d \
./src/openssl-master/crypto/des/cbc_enc.d \
./src/openssl-master/crypto/des/cfb64ede.d \
./src/openssl-master/crypto/des/cfb64enc.d \
./src/openssl-master/crypto/des/cfb_enc.d \
./src/openssl-master/crypto/des/des_enc.d \
./src/openssl-master/crypto/des/ecb3_enc.d \
./src/openssl-master/crypto/des/ecb_enc.d \
./src/openssl-master/crypto/des/fcrypt.d \
./src/openssl-master/crypto/des/fcrypt_b.d \
./src/openssl-master/crypto/des/ncbc_enc.d \
./src/openssl-master/crypto/des/ofb64ede.d \
./src/openssl-master/crypto/des/ofb64enc.d \
./src/openssl-master/crypto/des/ofb_enc.d \
./src/openssl-master/crypto/des/pcbc_enc.d \
./src/openssl-master/crypto/des/qud_cksm.d \
./src/openssl-master/crypto/des/rand_key.d \
./src/openssl-master/crypto/des/set_key.d \
./src/openssl-master/crypto/des/str2key.d \
./src/openssl-master/crypto/des/xcbc_enc.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/des/%.o: ../src/openssl-master/crypto/des/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


