################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/rc2/rc2_cbc.c \
../src/openssl-master/crypto/rc2/rc2_ecb.c \
../src/openssl-master/crypto/rc2/rc2_skey.c \
../src/openssl-master/crypto/rc2/rc2cfb64.c \
../src/openssl-master/crypto/rc2/rc2ofb64.c 

OBJS += \
./src/openssl-master/crypto/rc2/rc2_cbc.o \
./src/openssl-master/crypto/rc2/rc2_ecb.o \
./src/openssl-master/crypto/rc2/rc2_skey.o \
./src/openssl-master/crypto/rc2/rc2cfb64.o \
./src/openssl-master/crypto/rc2/rc2ofb64.o 

C_DEPS += \
./src/openssl-master/crypto/rc2/rc2_cbc.d \
./src/openssl-master/crypto/rc2/rc2_ecb.d \
./src/openssl-master/crypto/rc2/rc2_skey.d \
./src/openssl-master/crypto/rc2/rc2cfb64.d \
./src/openssl-master/crypto/rc2/rc2ofb64.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/rc2/%.o: ../src/openssl-master/crypto/rc2/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


