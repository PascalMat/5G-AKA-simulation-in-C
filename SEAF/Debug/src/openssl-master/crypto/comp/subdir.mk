################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/comp/c_zlib.c \
../src/openssl-master/crypto/comp/comp_err.c \
../src/openssl-master/crypto/comp/comp_lib.c 

OBJS += \
./src/openssl-master/crypto/comp/c_zlib.o \
./src/openssl-master/crypto/comp/comp_err.o \
./src/openssl-master/crypto/comp/comp_lib.o 

C_DEPS += \
./src/openssl-master/crypto/comp/c_zlib.d \
./src/openssl-master/crypto/comp/comp_err.d \
./src/openssl-master/crypto/comp/comp_lib.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/comp/%.o: ../src/openssl-master/crypto/comp/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


