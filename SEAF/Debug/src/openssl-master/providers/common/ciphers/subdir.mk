################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/providers/common/ciphers/aes.c \
../src/openssl-master/providers/common/ciphers/aes_basic.c \
../src/openssl-master/providers/common/ciphers/block.c 

OBJS += \
./src/openssl-master/providers/common/ciphers/aes.o \
./src/openssl-master/providers/common/ciphers/aes_basic.o \
./src/openssl-master/providers/common/ciphers/block.o 

C_DEPS += \
./src/openssl-master/providers/common/ciphers/aes.d \
./src/openssl-master/providers/common/ciphers/aes_basic.d \
./src/openssl-master/providers/common/ciphers/block.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/providers/common/ciphers/%.o: ../src/openssl-master/providers/common/ciphers/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


