################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/modes/cbc128.c \
../src/openssl-master/crypto/modes/ccm128.c \
../src/openssl-master/crypto/modes/cfb128.c \
../src/openssl-master/crypto/modes/ctr128.c \
../src/openssl-master/crypto/modes/cts128.c \
../src/openssl-master/crypto/modes/gcm128.c \
../src/openssl-master/crypto/modes/ocb128.c \
../src/openssl-master/crypto/modes/ofb128.c \
../src/openssl-master/crypto/modes/siv128.c \
../src/openssl-master/crypto/modes/wrap128.c \
../src/openssl-master/crypto/modes/xts128.c 

OBJS += \
./src/openssl-master/crypto/modes/cbc128.o \
./src/openssl-master/crypto/modes/ccm128.o \
./src/openssl-master/crypto/modes/cfb128.o \
./src/openssl-master/crypto/modes/ctr128.o \
./src/openssl-master/crypto/modes/cts128.o \
./src/openssl-master/crypto/modes/gcm128.o \
./src/openssl-master/crypto/modes/ocb128.o \
./src/openssl-master/crypto/modes/ofb128.o \
./src/openssl-master/crypto/modes/siv128.o \
./src/openssl-master/crypto/modes/wrap128.o \
./src/openssl-master/crypto/modes/xts128.o 

C_DEPS += \
./src/openssl-master/crypto/modes/cbc128.d \
./src/openssl-master/crypto/modes/ccm128.d \
./src/openssl-master/crypto/modes/cfb128.d \
./src/openssl-master/crypto/modes/ctr128.d \
./src/openssl-master/crypto/modes/cts128.d \
./src/openssl-master/crypto/modes/gcm128.d \
./src/openssl-master/crypto/modes/ocb128.d \
./src/openssl-master/crypto/modes/ofb128.d \
./src/openssl-master/crypto/modes/siv128.d \
./src/openssl-master/crypto/modes/wrap128.d \
./src/openssl-master/crypto/modes/xts128.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/modes/%.o: ../src/openssl-master/crypto/modes/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


