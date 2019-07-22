################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/providers/default/defltprov.c 

OBJS += \
./src/openssl-master/providers/default/defltprov.o 

C_DEPS += \
./src/openssl-master/providers/default/defltprov.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/providers/default/%.o: ../src/openssl-master/providers/default/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


