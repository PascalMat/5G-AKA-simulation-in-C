################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/blake2/blake2b.c \
../src/openssl-master/crypto/blake2/blake2b_mac.c \
../src/openssl-master/crypto/blake2/blake2s.c \
../src/openssl-master/crypto/blake2/blake2s_mac.c \
../src/openssl-master/crypto/blake2/m_blake2b.c \
../src/openssl-master/crypto/blake2/m_blake2s.c 

OBJS += \
./src/openssl-master/crypto/blake2/blake2b.o \
./src/openssl-master/crypto/blake2/blake2b_mac.o \
./src/openssl-master/crypto/blake2/blake2s.o \
./src/openssl-master/crypto/blake2/blake2s_mac.o \
./src/openssl-master/crypto/blake2/m_blake2b.o \
./src/openssl-master/crypto/blake2/m_blake2s.o 

C_DEPS += \
./src/openssl-master/crypto/blake2/blake2b.d \
./src/openssl-master/crypto/blake2/blake2b_mac.d \
./src/openssl-master/crypto/blake2/blake2s.d \
./src/openssl-master/crypto/blake2/blake2s_mac.d \
./src/openssl-master/crypto/blake2/m_blake2b.d \
./src/openssl-master/crypto/blake2/m_blake2s.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/blake2/%.o: ../src/openssl-master/crypto/blake2/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


