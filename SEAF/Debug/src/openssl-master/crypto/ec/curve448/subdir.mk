################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/ec/curve448/curve448.c \
../src/openssl-master/crypto/ec/curve448/curve448_tables.c \
../src/openssl-master/crypto/ec/curve448/eddsa.c \
../src/openssl-master/crypto/ec/curve448/f_generic.c \
../src/openssl-master/crypto/ec/curve448/scalar.c 

OBJS += \
./src/openssl-master/crypto/ec/curve448/curve448.o \
./src/openssl-master/crypto/ec/curve448/curve448_tables.o \
./src/openssl-master/crypto/ec/curve448/eddsa.o \
./src/openssl-master/crypto/ec/curve448/f_generic.o \
./src/openssl-master/crypto/ec/curve448/scalar.o 

C_DEPS += \
./src/openssl-master/crypto/ec/curve448/curve448.d \
./src/openssl-master/crypto/ec/curve448/curve448_tables.d \
./src/openssl-master/crypto/ec/curve448/eddsa.d \
./src/openssl-master/crypto/ec/curve448/f_generic.d \
./src/openssl-master/crypto/ec/curve448/scalar.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/ec/curve448/%.o: ../src/openssl-master/crypto/ec/curve448/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


