################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/ts/ts_asn1.c \
../src/openssl-master/crypto/ts/ts_conf.c \
../src/openssl-master/crypto/ts/ts_err.c \
../src/openssl-master/crypto/ts/ts_lib.c \
../src/openssl-master/crypto/ts/ts_req_print.c \
../src/openssl-master/crypto/ts/ts_req_utils.c \
../src/openssl-master/crypto/ts/ts_rsp_print.c \
../src/openssl-master/crypto/ts/ts_rsp_sign.c \
../src/openssl-master/crypto/ts/ts_rsp_utils.c \
../src/openssl-master/crypto/ts/ts_rsp_verify.c \
../src/openssl-master/crypto/ts/ts_verify_ctx.c 

OBJS += \
./src/openssl-master/crypto/ts/ts_asn1.o \
./src/openssl-master/crypto/ts/ts_conf.o \
./src/openssl-master/crypto/ts/ts_err.o \
./src/openssl-master/crypto/ts/ts_lib.o \
./src/openssl-master/crypto/ts/ts_req_print.o \
./src/openssl-master/crypto/ts/ts_req_utils.o \
./src/openssl-master/crypto/ts/ts_rsp_print.o \
./src/openssl-master/crypto/ts/ts_rsp_sign.o \
./src/openssl-master/crypto/ts/ts_rsp_utils.o \
./src/openssl-master/crypto/ts/ts_rsp_verify.o \
./src/openssl-master/crypto/ts/ts_verify_ctx.o 

C_DEPS += \
./src/openssl-master/crypto/ts/ts_asn1.d \
./src/openssl-master/crypto/ts/ts_conf.d \
./src/openssl-master/crypto/ts/ts_err.d \
./src/openssl-master/crypto/ts/ts_lib.d \
./src/openssl-master/crypto/ts/ts_req_print.d \
./src/openssl-master/crypto/ts/ts_req_utils.d \
./src/openssl-master/crypto/ts/ts_rsp_print.d \
./src/openssl-master/crypto/ts/ts_rsp_sign.d \
./src/openssl-master/crypto/ts/ts_rsp_utils.d \
./src/openssl-master/crypto/ts/ts_rsp_verify.d \
./src/openssl-master/crypto/ts/ts_verify_ctx.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/ts/%.o: ../src/openssl-master/crypto/ts/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


