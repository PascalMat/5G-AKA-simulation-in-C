################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../src/openssl-master/crypto/aes/asm/aes-ia64.S 

OBJS += \
./src/openssl-master/crypto/aes/asm/aes-ia64.o 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/aes/asm/%.o: ../src/openssl-master/crypto/aes/asm/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


