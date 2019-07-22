################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/property/defn_cache.c \
../src/openssl-master/crypto/property/property.c \
../src/openssl-master/crypto/property/property_err.c \
../src/openssl-master/crypto/property/property_parse.c \
../src/openssl-master/crypto/property/property_string.c 

OBJS += \
./src/openssl-master/crypto/property/defn_cache.o \
./src/openssl-master/crypto/property/property.o \
./src/openssl-master/crypto/property/property_err.o \
./src/openssl-master/crypto/property/property_parse.o \
./src/openssl-master/crypto/property/property_string.o 

C_DEPS += \
./src/openssl-master/crypto/property/defn_cache.d \
./src/openssl-master/crypto/property/property.d \
./src/openssl-master/crypto/property/property_err.d \
./src/openssl-master/crypto/property/property_parse.d \
./src/openssl-master/crypto/property/property_string.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/property/%.o: ../src/openssl-master/crypto/property/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


