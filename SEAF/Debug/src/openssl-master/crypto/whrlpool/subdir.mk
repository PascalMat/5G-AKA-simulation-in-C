################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/whrlpool/wp_block.c \
../src/openssl-master/crypto/whrlpool/wp_dgst.c 

OBJS += \
./src/openssl-master/crypto/whrlpool/wp_block.o \
./src/openssl-master/crypto/whrlpool/wp_dgst.o 

C_DEPS += \
./src/openssl-master/crypto/whrlpool/wp_block.d \
./src/openssl-master/crypto/whrlpool/wp_dgst.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/whrlpool/%.o: ../src/openssl-master/crypto/whrlpool/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


