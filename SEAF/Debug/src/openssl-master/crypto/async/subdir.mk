################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/async/async.c \
../src/openssl-master/crypto/async/async_err.c \
../src/openssl-master/crypto/async/async_wait.c 

OBJS += \
./src/openssl-master/crypto/async/async.o \
./src/openssl-master/crypto/async/async_err.o \
./src/openssl-master/crypto/async/async_wait.o 

C_DEPS += \
./src/openssl-master/crypto/async/async.d \
./src/openssl-master/crypto/async/async_err.d \
./src/openssl-master/crypto/async/async_wait.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/async/%.o: ../src/openssl-master/crypto/async/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


