################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/siphash/siphash.c \
../src/openssl-master/crypto/siphash/siphash_ameth.c \
../src/openssl-master/crypto/siphash/siphash_meth.c 

OBJS += \
./src/openssl-master/crypto/siphash/siphash.o \
./src/openssl-master/crypto/siphash/siphash_ameth.o \
./src/openssl-master/crypto/siphash/siphash_meth.o 

C_DEPS += \
./src/openssl-master/crypto/siphash/siphash.d \
./src/openssl-master/crypto/siphash/siphash_ameth.d \
./src/openssl-master/crypto/siphash/siphash_meth.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/siphash/%.o: ../src/openssl-master/crypto/siphash/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


