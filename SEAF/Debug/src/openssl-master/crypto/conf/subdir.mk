################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/conf/conf_api.c \
../src/openssl-master/crypto/conf/conf_def.c \
../src/openssl-master/crypto/conf/conf_err.c \
../src/openssl-master/crypto/conf/conf_lib.c \
../src/openssl-master/crypto/conf/conf_mall.c \
../src/openssl-master/crypto/conf/conf_mod.c \
../src/openssl-master/crypto/conf/conf_sap.c \
../src/openssl-master/crypto/conf/conf_ssl.c 

OBJS += \
./src/openssl-master/crypto/conf/conf_api.o \
./src/openssl-master/crypto/conf/conf_def.o \
./src/openssl-master/crypto/conf/conf_err.o \
./src/openssl-master/crypto/conf/conf_lib.o \
./src/openssl-master/crypto/conf/conf_mall.o \
./src/openssl-master/crypto/conf/conf_mod.o \
./src/openssl-master/crypto/conf/conf_sap.o \
./src/openssl-master/crypto/conf/conf_ssl.o 

C_DEPS += \
./src/openssl-master/crypto/conf/conf_api.d \
./src/openssl-master/crypto/conf/conf_def.d \
./src/openssl-master/crypto/conf/conf_err.d \
./src/openssl-master/crypto/conf/conf_lib.d \
./src/openssl-master/crypto/conf/conf_mall.d \
./src/openssl-master/crypto/conf/conf_mod.d \
./src/openssl-master/crypto/conf/conf_sap.d \
./src/openssl-master/crypto/conf/conf_ssl.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/conf/%.o: ../src/openssl-master/crypto/conf/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


