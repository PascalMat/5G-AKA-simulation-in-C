################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/cms/cms_asn1.c \
../src/openssl-master/crypto/cms/cms_att.c \
../src/openssl-master/crypto/cms/cms_cd.c \
../src/openssl-master/crypto/cms/cms_dd.c \
../src/openssl-master/crypto/cms/cms_enc.c \
../src/openssl-master/crypto/cms/cms_env.c \
../src/openssl-master/crypto/cms/cms_err.c \
../src/openssl-master/crypto/cms/cms_ess.c \
../src/openssl-master/crypto/cms/cms_io.c \
../src/openssl-master/crypto/cms/cms_kari.c \
../src/openssl-master/crypto/cms/cms_lib.c \
../src/openssl-master/crypto/cms/cms_pwri.c \
../src/openssl-master/crypto/cms/cms_sd.c \
../src/openssl-master/crypto/cms/cms_smime.c 

OBJS += \
./src/openssl-master/crypto/cms/cms_asn1.o \
./src/openssl-master/crypto/cms/cms_att.o \
./src/openssl-master/crypto/cms/cms_cd.o \
./src/openssl-master/crypto/cms/cms_dd.o \
./src/openssl-master/crypto/cms/cms_enc.o \
./src/openssl-master/crypto/cms/cms_env.o \
./src/openssl-master/crypto/cms/cms_err.o \
./src/openssl-master/crypto/cms/cms_ess.o \
./src/openssl-master/crypto/cms/cms_io.o \
./src/openssl-master/crypto/cms/cms_kari.o \
./src/openssl-master/crypto/cms/cms_lib.o \
./src/openssl-master/crypto/cms/cms_pwri.o \
./src/openssl-master/crypto/cms/cms_sd.o \
./src/openssl-master/crypto/cms/cms_smime.o 

C_DEPS += \
./src/openssl-master/crypto/cms/cms_asn1.d \
./src/openssl-master/crypto/cms/cms_att.d \
./src/openssl-master/crypto/cms/cms_cd.d \
./src/openssl-master/crypto/cms/cms_dd.d \
./src/openssl-master/crypto/cms/cms_enc.d \
./src/openssl-master/crypto/cms/cms_env.d \
./src/openssl-master/crypto/cms/cms_err.d \
./src/openssl-master/crypto/cms/cms_ess.d \
./src/openssl-master/crypto/cms/cms_io.d \
./src/openssl-master/crypto/cms/cms_kari.d \
./src/openssl-master/crypto/cms/cms_lib.d \
./src/openssl-master/crypto/cms/cms_pwri.d \
./src/openssl-master/crypto/cms/cms_sd.d \
./src/openssl-master/crypto/cms/cms_smime.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/cms/%.o: ../src/openssl-master/crypto/cms/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


