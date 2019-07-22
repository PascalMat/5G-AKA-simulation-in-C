################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/kdf/hkdf.c \
../src/openssl-master/crypto/kdf/kdf_err.c \
../src/openssl-master/crypto/kdf/kdf_util.c \
../src/openssl-master/crypto/kdf/pbkdf2.c \
../src/openssl-master/crypto/kdf/scrypt.c \
../src/openssl-master/crypto/kdf/sshkdf.c \
../src/openssl-master/crypto/kdf/sskdf.c \
../src/openssl-master/crypto/kdf/tls1_prf.c 

OBJS += \
./src/openssl-master/crypto/kdf/hkdf.o \
./src/openssl-master/crypto/kdf/kdf_err.o \
./src/openssl-master/crypto/kdf/kdf_util.o \
./src/openssl-master/crypto/kdf/pbkdf2.o \
./src/openssl-master/crypto/kdf/scrypt.o \
./src/openssl-master/crypto/kdf/sshkdf.o \
./src/openssl-master/crypto/kdf/sskdf.o \
./src/openssl-master/crypto/kdf/tls1_prf.o 

C_DEPS += \
./src/openssl-master/crypto/kdf/hkdf.d \
./src/openssl-master/crypto/kdf/kdf_err.d \
./src/openssl-master/crypto/kdf/kdf_util.d \
./src/openssl-master/crypto/kdf/pbkdf2.d \
./src/openssl-master/crypto/kdf/scrypt.d \
./src/openssl-master/crypto/kdf/sshkdf.d \
./src/openssl-master/crypto/kdf/sskdf.d \
./src/openssl-master/crypto/kdf/tls1_prf.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/kdf/%.o: ../src/openssl-master/crypto/kdf/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


