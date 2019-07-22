################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/err/err.c \
../src/openssl-master/crypto/err/err_all.c \
../src/openssl-master/crypto/err/err_prn.c 

OBJS += \
./src/openssl-master/crypto/err/err.o \
./src/openssl-master/crypto/err/err_all.o \
./src/openssl-master/crypto/err/err_prn.o 

C_DEPS += \
./src/openssl-master/crypto/err/err.d \
./src/openssl-master/crypto/err/err_all.d \
./src/openssl-master/crypto/err/err_prn.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/err/%.o: ../src/openssl-master/crypto/err/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


