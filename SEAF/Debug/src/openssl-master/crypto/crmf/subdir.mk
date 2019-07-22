################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/crmf/crmf_asn.c \
../src/openssl-master/crypto/crmf/crmf_err.c \
../src/openssl-master/crypto/crmf/crmf_lib.c \
../src/openssl-master/crypto/crmf/crmf_pbm.c 

OBJS += \
./src/openssl-master/crypto/crmf/crmf_asn.o \
./src/openssl-master/crypto/crmf/crmf_err.o \
./src/openssl-master/crypto/crmf/crmf_lib.o \
./src/openssl-master/crypto/crmf/crmf_pbm.o 

C_DEPS += \
./src/openssl-master/crypto/crmf/crmf_asn.d \
./src/openssl-master/crypto/crmf/crmf_err.d \
./src/openssl-master/crypto/crmf/crmf_lib.d \
./src/openssl-master/crypto/crmf/crmf_pbm.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/crmf/%.o: ../src/openssl-master/crypto/crmf/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


