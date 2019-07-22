################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/ct/ct_b64.c \
../src/openssl-master/crypto/ct/ct_err.c \
../src/openssl-master/crypto/ct/ct_log.c \
../src/openssl-master/crypto/ct/ct_oct.c \
../src/openssl-master/crypto/ct/ct_policy.c \
../src/openssl-master/crypto/ct/ct_prn.c \
../src/openssl-master/crypto/ct/ct_sct.c \
../src/openssl-master/crypto/ct/ct_sct_ctx.c \
../src/openssl-master/crypto/ct/ct_vfy.c \
../src/openssl-master/crypto/ct/ct_x509v3.c 

OBJS += \
./src/openssl-master/crypto/ct/ct_b64.o \
./src/openssl-master/crypto/ct/ct_err.o \
./src/openssl-master/crypto/ct/ct_log.o \
./src/openssl-master/crypto/ct/ct_oct.o \
./src/openssl-master/crypto/ct/ct_policy.o \
./src/openssl-master/crypto/ct/ct_prn.o \
./src/openssl-master/crypto/ct/ct_sct.o \
./src/openssl-master/crypto/ct/ct_sct_ctx.o \
./src/openssl-master/crypto/ct/ct_vfy.o \
./src/openssl-master/crypto/ct/ct_x509v3.o 

C_DEPS += \
./src/openssl-master/crypto/ct/ct_b64.d \
./src/openssl-master/crypto/ct/ct_err.d \
./src/openssl-master/crypto/ct/ct_log.d \
./src/openssl-master/crypto/ct/ct_oct.d \
./src/openssl-master/crypto/ct/ct_policy.d \
./src/openssl-master/crypto/ct/ct_prn.d \
./src/openssl-master/crypto/ct/ct_sct.d \
./src/openssl-master/crypto/ct/ct_sct_ctx.d \
./src/openssl-master/crypto/ct/ct_vfy.d \
./src/openssl-master/crypto/ct/ct_x509v3.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/ct/%.o: ../src/openssl-master/crypto/ct/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


