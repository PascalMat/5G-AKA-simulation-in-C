################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/kmac/kmac.c 

OBJS += \
./src/openssl-master/crypto/kmac/kmac.o 

C_DEPS += \
./src/openssl-master/crypto/kmac/kmac.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/kmac/%.o: ../src/openssl-master/crypto/kmac/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


