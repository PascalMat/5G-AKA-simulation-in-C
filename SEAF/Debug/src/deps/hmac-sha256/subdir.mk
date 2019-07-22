################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/deps/hmac-sha256/hmac-sha256.c 

OBJS += \
./src/deps/hmac-sha256/hmac-sha256.o 

C_DEPS += \
./src/deps/hmac-sha256/hmac-sha256.d 


# Each subdirectory must supply rules for building sources it contributes
src/deps/hmac-sha256/%.o: ../src/deps/hmac-sha256/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


