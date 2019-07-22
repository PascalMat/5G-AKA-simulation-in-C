################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/ms/applink.c \
../src/openssl-master/ms/uplink.c 

OBJS += \
./src/openssl-master/ms/applink.o \
./src/openssl-master/ms/uplink.o 

C_DEPS += \
./src/openssl-master/ms/applink.d \
./src/openssl-master/ms/uplink.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/ms/%.o: ../src/openssl-master/ms/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


