################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/demos/evp/aesccm.c \
../src/openssl-master/demos/evp/aesgcm.c 

OBJS += \
./src/openssl-master/demos/evp/aesccm.o \
./src/openssl-master/demos/evp/aesgcm.o 

C_DEPS += \
./src/openssl-master/demos/evp/aesccm.d \
./src/openssl-master/demos/evp/aesgcm.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/demos/evp/%.o: ../src/openssl-master/demos/evp/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


