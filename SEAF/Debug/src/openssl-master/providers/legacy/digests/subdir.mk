################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/providers/legacy/digests/md2.c 

OBJS += \
./src/openssl-master/providers/legacy/digests/md2.o 

C_DEPS += \
./src/openssl-master/providers/legacy/digests/md2.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/providers/legacy/digests/%.o: ../src/openssl-master/providers/legacy/digests/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


