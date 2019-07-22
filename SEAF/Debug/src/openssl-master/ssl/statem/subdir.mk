################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/ssl/statem/extensions.c \
../src/openssl-master/ssl/statem/extensions_clnt.c \
../src/openssl-master/ssl/statem/extensions_cust.c \
../src/openssl-master/ssl/statem/extensions_srvr.c \
../src/openssl-master/ssl/statem/statem.c \
../src/openssl-master/ssl/statem/statem_clnt.c \
../src/openssl-master/ssl/statem/statem_dtls.c \
../src/openssl-master/ssl/statem/statem_lib.c \
../src/openssl-master/ssl/statem/statem_srvr.c 

OBJS += \
./src/openssl-master/ssl/statem/extensions.o \
./src/openssl-master/ssl/statem/extensions_clnt.o \
./src/openssl-master/ssl/statem/extensions_cust.o \
./src/openssl-master/ssl/statem/extensions_srvr.o \
./src/openssl-master/ssl/statem/statem.o \
./src/openssl-master/ssl/statem/statem_clnt.o \
./src/openssl-master/ssl/statem/statem_dtls.o \
./src/openssl-master/ssl/statem/statem_lib.o \
./src/openssl-master/ssl/statem/statem_srvr.o 

C_DEPS += \
./src/openssl-master/ssl/statem/extensions.d \
./src/openssl-master/ssl/statem/extensions_clnt.d \
./src/openssl-master/ssl/statem/extensions_cust.d \
./src/openssl-master/ssl/statem/extensions_srvr.d \
./src/openssl-master/ssl/statem/statem.d \
./src/openssl-master/ssl/statem/statem_clnt.d \
./src/openssl-master/ssl/statem/statem_dtls.d \
./src/openssl-master/ssl/statem/statem_lib.d \
./src/openssl-master/ssl/statem/statem_srvr.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/ssl/statem/%.o: ../src/openssl-master/ssl/statem/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


