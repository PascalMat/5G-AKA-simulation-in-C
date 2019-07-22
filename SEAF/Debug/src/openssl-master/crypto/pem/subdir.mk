################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/pem/pem_all.c \
../src/openssl-master/crypto/pem/pem_err.c \
../src/openssl-master/crypto/pem/pem_info.c \
../src/openssl-master/crypto/pem/pem_lib.c \
../src/openssl-master/crypto/pem/pem_oth.c \
../src/openssl-master/crypto/pem/pem_pk8.c \
../src/openssl-master/crypto/pem/pem_pkey.c \
../src/openssl-master/crypto/pem/pem_sign.c \
../src/openssl-master/crypto/pem/pem_x509.c \
../src/openssl-master/crypto/pem/pem_xaux.c \
../src/openssl-master/crypto/pem/pvkfmt.c 

OBJS += \
./src/openssl-master/crypto/pem/pem_all.o \
./src/openssl-master/crypto/pem/pem_err.o \
./src/openssl-master/crypto/pem/pem_info.o \
./src/openssl-master/crypto/pem/pem_lib.o \
./src/openssl-master/crypto/pem/pem_oth.o \
./src/openssl-master/crypto/pem/pem_pk8.o \
./src/openssl-master/crypto/pem/pem_pkey.o \
./src/openssl-master/crypto/pem/pem_sign.o \
./src/openssl-master/crypto/pem/pem_x509.o \
./src/openssl-master/crypto/pem/pem_xaux.o \
./src/openssl-master/crypto/pem/pvkfmt.o 

C_DEPS += \
./src/openssl-master/crypto/pem/pem_all.d \
./src/openssl-master/crypto/pem/pem_err.d \
./src/openssl-master/crypto/pem/pem_info.d \
./src/openssl-master/crypto/pem/pem_lib.d \
./src/openssl-master/crypto/pem/pem_oth.d \
./src/openssl-master/crypto/pem/pem_pk8.d \
./src/openssl-master/crypto/pem/pem_pkey.d \
./src/openssl-master/crypto/pem/pem_sign.d \
./src/openssl-master/crypto/pem/pem_x509.d \
./src/openssl-master/crypto/pem/pem_xaux.d \
./src/openssl-master/crypto/pem/pvkfmt.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/pem/%.o: ../src/openssl-master/crypto/pem/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


