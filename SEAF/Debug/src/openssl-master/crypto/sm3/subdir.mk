################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/sm3/m_sm3.c \
../src/openssl-master/crypto/sm3/sm3.c 

OBJS += \
./src/openssl-master/crypto/sm3/m_sm3.o \
./src/openssl-master/crypto/sm3/sm3.o 

C_DEPS += \
./src/openssl-master/crypto/sm3/m_sm3.d \
./src/openssl-master/crypto/sm3/sm3.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/sm3/%.o: ../src/openssl-master/crypto/sm3/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


