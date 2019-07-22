################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/seed/seed.c \
../src/openssl-master/crypto/seed/seed_cbc.c \
../src/openssl-master/crypto/seed/seed_cfb.c \
../src/openssl-master/crypto/seed/seed_ecb.c \
../src/openssl-master/crypto/seed/seed_ofb.c 

OBJS += \
./src/openssl-master/crypto/seed/seed.o \
./src/openssl-master/crypto/seed/seed_cbc.o \
./src/openssl-master/crypto/seed/seed_cfb.o \
./src/openssl-master/crypto/seed/seed_ecb.o \
./src/openssl-master/crypto/seed/seed_ofb.o 

C_DEPS += \
./src/openssl-master/crypto/seed/seed.d \
./src/openssl-master/crypto/seed/seed_cbc.d \
./src/openssl-master/crypto/seed/seed_cfb.d \
./src/openssl-master/crypto/seed/seed_ecb.d \
./src/openssl-master/crypto/seed/seed_ofb.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/seed/%.o: ../src/openssl-master/crypto/seed/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


