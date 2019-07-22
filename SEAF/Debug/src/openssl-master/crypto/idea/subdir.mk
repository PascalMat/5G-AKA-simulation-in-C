################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/idea/i_cbc.c \
../src/openssl-master/crypto/idea/i_cfb64.c \
../src/openssl-master/crypto/idea/i_ecb.c \
../src/openssl-master/crypto/idea/i_ofb64.c \
../src/openssl-master/crypto/idea/i_skey.c 

OBJS += \
./src/openssl-master/crypto/idea/i_cbc.o \
./src/openssl-master/crypto/idea/i_cfb64.o \
./src/openssl-master/crypto/idea/i_ecb.o \
./src/openssl-master/crypto/idea/i_ofb64.o \
./src/openssl-master/crypto/idea/i_skey.o 

C_DEPS += \
./src/openssl-master/crypto/idea/i_cbc.d \
./src/openssl-master/crypto/idea/i_cfb64.d \
./src/openssl-master/crypto/idea/i_ecb.d \
./src/openssl-master/crypto/idea/i_ofb64.d \
./src/openssl-master/crypto/idea/i_skey.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/idea/%.o: ../src/openssl-master/crypto/idea/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


