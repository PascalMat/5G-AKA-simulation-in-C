################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/cmac/cm_ameth.c \
../src/openssl-master/crypto/cmac/cm_meth.c \
../src/openssl-master/crypto/cmac/cmac.c 

OBJS += \
./src/openssl-master/crypto/cmac/cm_ameth.o \
./src/openssl-master/crypto/cmac/cm_meth.o \
./src/openssl-master/crypto/cmac/cmac.o 

C_DEPS += \
./src/openssl-master/crypto/cmac/cm_ameth.d \
./src/openssl-master/crypto/cmac/cm_meth.d \
./src/openssl-master/crypto/cmac/cmac.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/cmac/%.o: ../src/openssl-master/crypto/cmac/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


