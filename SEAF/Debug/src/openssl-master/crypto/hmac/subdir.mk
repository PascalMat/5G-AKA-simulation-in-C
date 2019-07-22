################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/hmac/hm_ameth.c \
../src/openssl-master/crypto/hmac/hm_meth.c \
../src/openssl-master/crypto/hmac/hmac.c 

OBJS += \
./src/openssl-master/crypto/hmac/hm_ameth.o \
./src/openssl-master/crypto/hmac/hm_meth.o \
./src/openssl-master/crypto/hmac/hmac.o 

C_DEPS += \
./src/openssl-master/crypto/hmac/hm_ameth.d \
./src/openssl-master/crypto/hmac/hm_meth.d \
./src/openssl-master/crypto/hmac/hmac.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/hmac/%.o: ../src/openssl-master/crypto/hmac/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


