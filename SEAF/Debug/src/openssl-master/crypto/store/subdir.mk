################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/store/loader_file.c \
../src/openssl-master/crypto/store/store_err.c \
../src/openssl-master/crypto/store/store_init.c \
../src/openssl-master/crypto/store/store_lib.c \
../src/openssl-master/crypto/store/store_register.c \
../src/openssl-master/crypto/store/store_strings.c 

OBJS += \
./src/openssl-master/crypto/store/loader_file.o \
./src/openssl-master/crypto/store/store_err.o \
./src/openssl-master/crypto/store/store_init.o \
./src/openssl-master/crypto/store/store_lib.o \
./src/openssl-master/crypto/store/store_register.o \
./src/openssl-master/crypto/store/store_strings.o 

C_DEPS += \
./src/openssl-master/crypto/store/loader_file.d \
./src/openssl-master/crypto/store/store_err.d \
./src/openssl-master/crypto/store/store_init.d \
./src/openssl-master/crypto/store/store_lib.d \
./src/openssl-master/crypto/store/store_register.d \
./src/openssl-master/crypto/store/store_strings.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/store/%.o: ../src/openssl-master/crypto/store/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


