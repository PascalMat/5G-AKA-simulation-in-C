################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/rc5/rc5_ecb.c \
../src/openssl-master/crypto/rc5/rc5_enc.c \
../src/openssl-master/crypto/rc5/rc5_skey.c \
../src/openssl-master/crypto/rc5/rc5cfb64.c \
../src/openssl-master/crypto/rc5/rc5ofb64.c 

OBJS += \
./src/openssl-master/crypto/rc5/rc5_ecb.o \
./src/openssl-master/crypto/rc5/rc5_enc.o \
./src/openssl-master/crypto/rc5/rc5_skey.o \
./src/openssl-master/crypto/rc5/rc5cfb64.o \
./src/openssl-master/crypto/rc5/rc5ofb64.o 

C_DEPS += \
./src/openssl-master/crypto/rc5/rc5_ecb.d \
./src/openssl-master/crypto/rc5/rc5_enc.d \
./src/openssl-master/crypto/rc5/rc5_skey.d \
./src/openssl-master/crypto/rc5/rc5cfb64.d \
./src/openssl-master/crypto/rc5/rc5ofb64.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/rc5/%.o: ../src/openssl-master/crypto/rc5/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


