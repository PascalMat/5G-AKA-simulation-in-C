################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/mdc2/mdc2_one.c \
../src/openssl-master/crypto/mdc2/mdc2dgst.c 

OBJS += \
./src/openssl-master/crypto/mdc2/mdc2_one.o \
./src/openssl-master/crypto/mdc2/mdc2dgst.o 

C_DEPS += \
./src/openssl-master/crypto/mdc2/mdc2_one.d \
./src/openssl-master/crypto/mdc2/mdc2dgst.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/mdc2/%.o: ../src/openssl-master/crypto/mdc2/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


