################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/buffer/buf_err.c \
../src/openssl-master/crypto/buffer/buffer.c 

OBJS += \
./src/openssl-master/crypto/buffer/buf_err.o \
./src/openssl-master/crypto/buffer/buffer.o 

C_DEPS += \
./src/openssl-master/crypto/buffer/buf_err.d \
./src/openssl-master/crypto/buffer/buffer.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/buffer/%.o: ../src/openssl-master/crypto/buffer/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


