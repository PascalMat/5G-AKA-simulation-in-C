################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/ui/ui_err.c \
../src/openssl-master/crypto/ui/ui_lib.c \
../src/openssl-master/crypto/ui/ui_null.c \
../src/openssl-master/crypto/ui/ui_openssl.c \
../src/openssl-master/crypto/ui/ui_util.c 

OBJS += \
./src/openssl-master/crypto/ui/ui_err.o \
./src/openssl-master/crypto/ui/ui_lib.o \
./src/openssl-master/crypto/ui/ui_null.o \
./src/openssl-master/crypto/ui/ui_openssl.o \
./src/openssl-master/crypto/ui/ui_util.o 

C_DEPS += \
./src/openssl-master/crypto/ui/ui_err.d \
./src/openssl-master/crypto/ui/ui_lib.d \
./src/openssl-master/crypto/ui/ui_null.d \
./src/openssl-master/crypto/ui/ui_openssl.d \
./src/openssl-master/crypto/ui/ui_util.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/ui/%.o: ../src/openssl-master/crypto/ui/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


