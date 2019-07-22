################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/aes/aes_cbc.c \
../src/openssl-master/crypto/aes/aes_cfb.c \
../src/openssl-master/crypto/aes/aes_core.c \
../src/openssl-master/crypto/aes/aes_ecb.c \
../src/openssl-master/crypto/aes/aes_ige.c \
../src/openssl-master/crypto/aes/aes_misc.c \
../src/openssl-master/crypto/aes/aes_ofb.c \
../src/openssl-master/crypto/aes/aes_wrap.c \
../src/openssl-master/crypto/aes/aes_x86core.c 

OBJS += \
./src/openssl-master/crypto/aes/aes_cbc.o \
./src/openssl-master/crypto/aes/aes_cfb.o \
./src/openssl-master/crypto/aes/aes_core.o \
./src/openssl-master/crypto/aes/aes_ecb.o \
./src/openssl-master/crypto/aes/aes_ige.o \
./src/openssl-master/crypto/aes/aes_misc.o \
./src/openssl-master/crypto/aes/aes_ofb.o \
./src/openssl-master/crypto/aes/aes_wrap.o \
./src/openssl-master/crypto/aes/aes_x86core.o 

C_DEPS += \
./src/openssl-master/crypto/aes/aes_cbc.d \
./src/openssl-master/crypto/aes/aes_cfb.d \
./src/openssl-master/crypto/aes/aes_core.d \
./src/openssl-master/crypto/aes/aes_ecb.d \
./src/openssl-master/crypto/aes/aes_ige.d \
./src/openssl-master/crypto/aes/aes_misc.d \
./src/openssl-master/crypto/aes/aes_ofb.d \
./src/openssl-master/crypto/aes/aes_wrap.d \
./src/openssl-master/crypto/aes/aes_x86core.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/aes/%.o: ../src/openssl-master/crypto/aes/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


