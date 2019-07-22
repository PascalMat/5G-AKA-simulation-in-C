################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/sm2/sm2_crypt.c \
../src/openssl-master/crypto/sm2/sm2_err.c \
../src/openssl-master/crypto/sm2/sm2_pmeth.c \
../src/openssl-master/crypto/sm2/sm2_sign.c 

OBJS += \
./src/openssl-master/crypto/sm2/sm2_crypt.o \
./src/openssl-master/crypto/sm2/sm2_err.o \
./src/openssl-master/crypto/sm2/sm2_pmeth.o \
./src/openssl-master/crypto/sm2/sm2_sign.o 

C_DEPS += \
./src/openssl-master/crypto/sm2/sm2_crypt.d \
./src/openssl-master/crypto/sm2/sm2_err.d \
./src/openssl-master/crypto/sm2/sm2_pmeth.d \
./src/openssl-master/crypto/sm2/sm2_sign.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/sm2/%.o: ../src/openssl-master/crypto/sm2/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


