################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/camellia/camellia.c \
../src/openssl-master/crypto/camellia/cmll_cbc.c \
../src/openssl-master/crypto/camellia/cmll_cfb.c \
../src/openssl-master/crypto/camellia/cmll_ctr.c \
../src/openssl-master/crypto/camellia/cmll_ecb.c \
../src/openssl-master/crypto/camellia/cmll_misc.c \
../src/openssl-master/crypto/camellia/cmll_ofb.c 

OBJS += \
./src/openssl-master/crypto/camellia/camellia.o \
./src/openssl-master/crypto/camellia/cmll_cbc.o \
./src/openssl-master/crypto/camellia/cmll_cfb.o \
./src/openssl-master/crypto/camellia/cmll_ctr.o \
./src/openssl-master/crypto/camellia/cmll_ecb.o \
./src/openssl-master/crypto/camellia/cmll_misc.o \
./src/openssl-master/crypto/camellia/cmll_ofb.o 

C_DEPS += \
./src/openssl-master/crypto/camellia/camellia.d \
./src/openssl-master/crypto/camellia/cmll_cbc.d \
./src/openssl-master/crypto/camellia/cmll_cfb.d \
./src/openssl-master/crypto/camellia/cmll_ctr.d \
./src/openssl-master/crypto/camellia/cmll_ecb.d \
./src/openssl-master/crypto/camellia/cmll_misc.d \
./src/openssl-master/crypto/camellia/cmll_ofb.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/camellia/%.o: ../src/openssl-master/crypto/camellia/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


