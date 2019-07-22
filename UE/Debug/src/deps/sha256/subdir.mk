################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/deps/sha256/sha256.c 

OBJS += \
./src/deps/sha256/sha256.o 

C_DEPS += \
./src/deps/sha256/sha256.d 


# Each subdirectory must supply rules for building sources it contributes
src/deps/sha256/%.o: ../src/deps/sha256/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


