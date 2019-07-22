################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/poly1305/poly1305.c \
../src/openssl-master/crypto/poly1305/poly1305_ameth.c \
../src/openssl-master/crypto/poly1305/poly1305_base2_44.c \
../src/openssl-master/crypto/poly1305/poly1305_ieee754.c \
../src/openssl-master/crypto/poly1305/poly1305_meth.c 

OBJS += \
./src/openssl-master/crypto/poly1305/poly1305.o \
./src/openssl-master/crypto/poly1305/poly1305_ameth.o \
./src/openssl-master/crypto/poly1305/poly1305_base2_44.o \
./src/openssl-master/crypto/poly1305/poly1305_ieee754.o \
./src/openssl-master/crypto/poly1305/poly1305_meth.o 

C_DEPS += \
./src/openssl-master/crypto/poly1305/poly1305.d \
./src/openssl-master/crypto/poly1305/poly1305_ameth.d \
./src/openssl-master/crypto/poly1305/poly1305_base2_44.d \
./src/openssl-master/crypto/poly1305/poly1305_ieee754.d \
./src/openssl-master/crypto/poly1305/poly1305_meth.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/poly1305/%.o: ../src/openssl-master/crypto/poly1305/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


