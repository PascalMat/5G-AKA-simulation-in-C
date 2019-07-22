################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/engines/e_afalg.c \
../src/openssl-master/engines/e_afalg_err.c \
../src/openssl-master/engines/e_capi.c \
../src/openssl-master/engines/e_capi_err.c \
../src/openssl-master/engines/e_dasync.c \
../src/openssl-master/engines/e_dasync_err.c \
../src/openssl-master/engines/e_devcrypto.c \
../src/openssl-master/engines/e_ossltest.c \
../src/openssl-master/engines/e_ossltest_err.c \
../src/openssl-master/engines/e_padlock.c 

OBJS += \
./src/openssl-master/engines/e_afalg.o \
./src/openssl-master/engines/e_afalg_err.o \
./src/openssl-master/engines/e_capi.o \
./src/openssl-master/engines/e_capi_err.o \
./src/openssl-master/engines/e_dasync.o \
./src/openssl-master/engines/e_dasync_err.o \
./src/openssl-master/engines/e_devcrypto.o \
./src/openssl-master/engines/e_ossltest.o \
./src/openssl-master/engines/e_ossltest_err.o \
./src/openssl-master/engines/e_padlock.o 

C_DEPS += \
./src/openssl-master/engines/e_afalg.d \
./src/openssl-master/engines/e_afalg_err.d \
./src/openssl-master/engines/e_capi.d \
./src/openssl-master/engines/e_capi_err.d \
./src/openssl-master/engines/e_dasync.d \
./src/openssl-master/engines/e_dasync_err.d \
./src/openssl-master/engines/e_devcrypto.d \
./src/openssl-master/engines/e_ossltest.d \
./src/openssl-master/engines/e_ossltest_err.d \
./src/openssl-master/engines/e_padlock.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/engines/%.o: ../src/openssl-master/engines/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


