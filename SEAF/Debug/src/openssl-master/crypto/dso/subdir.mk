################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/dso/dso_dl.c \
../src/openssl-master/crypto/dso/dso_dlfcn.c \
../src/openssl-master/crypto/dso/dso_err.c \
../src/openssl-master/crypto/dso/dso_lib.c \
../src/openssl-master/crypto/dso/dso_openssl.c \
../src/openssl-master/crypto/dso/dso_vms.c \
../src/openssl-master/crypto/dso/dso_win32.c 

OBJS += \
./src/openssl-master/crypto/dso/dso_dl.o \
./src/openssl-master/crypto/dso/dso_dlfcn.o \
./src/openssl-master/crypto/dso/dso_err.o \
./src/openssl-master/crypto/dso/dso_lib.o \
./src/openssl-master/crypto/dso/dso_openssl.o \
./src/openssl-master/crypto/dso/dso_vms.o \
./src/openssl-master/crypto/dso/dso_win32.o 

C_DEPS += \
./src/openssl-master/crypto/dso/dso_dl.d \
./src/openssl-master/crypto/dso/dso_dlfcn.d \
./src/openssl-master/crypto/dso/dso_err.d \
./src/openssl-master/crypto/dso/dso_lib.d \
./src/openssl-master/crypto/dso/dso_openssl.d \
./src/openssl-master/crypto/dso/dso_vms.d \
./src/openssl-master/crypto/dso/dso_win32.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/dso/%.o: ../src/openssl-master/crypto/dso/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


