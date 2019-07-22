################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/lhash/lh_stats.c \
../src/openssl-master/crypto/lhash/lhash.c 

OBJS += \
./src/openssl-master/crypto/lhash/lh_stats.o \
./src/openssl-master/crypto/lhash/lhash.o 

C_DEPS += \
./src/openssl-master/crypto/lhash/lh_stats.d \
./src/openssl-master/crypto/lhash/lhash.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/lhash/%.o: ../src/openssl-master/crypto/lhash/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


