################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/sha/keccak1600.c \
../src/openssl-master/crypto/sha/sha1_one.c \
../src/openssl-master/crypto/sha/sha1dgst.c \
../src/openssl-master/crypto/sha/sha256.c \
../src/openssl-master/crypto/sha/sha512.c 

OBJS += \
./src/openssl-master/crypto/sha/keccak1600.o \
./src/openssl-master/crypto/sha/sha1_one.o \
./src/openssl-master/crypto/sha/sha1dgst.o \
./src/openssl-master/crypto/sha/sha256.o \
./src/openssl-master/crypto/sha/sha512.o 

C_DEPS += \
./src/openssl-master/crypto/sha/keccak1600.d \
./src/openssl-master/crypto/sha/sha1_one.d \
./src/openssl-master/crypto/sha/sha1dgst.d \
./src/openssl-master/crypto/sha/sha256.d \
./src/openssl-master/crypto/sha/sha512.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/sha/%.o: ../src/openssl-master/crypto/sha/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


