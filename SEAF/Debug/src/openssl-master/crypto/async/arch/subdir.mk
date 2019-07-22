################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/async/arch/async_null.c \
../src/openssl-master/crypto/async/arch/async_posix.c \
../src/openssl-master/crypto/async/arch/async_win.c 

OBJS += \
./src/openssl-master/crypto/async/arch/async_null.o \
./src/openssl-master/crypto/async/arch/async_posix.o \
./src/openssl-master/crypto/async/arch/async_win.o 

C_DEPS += \
./src/openssl-master/crypto/async/arch/async_null.d \
./src/openssl-master/crypto/async/arch/async_posix.d \
./src/openssl-master/crypto/async/arch/async_win.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/async/arch/%.o: ../src/openssl-master/crypto/async/arch/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


