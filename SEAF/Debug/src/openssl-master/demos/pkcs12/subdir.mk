################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/demos/pkcs12/pkread.c \
../src/openssl-master/demos/pkcs12/pkwrite.c 

OBJS += \
./src/openssl-master/demos/pkcs12/pkread.o \
./src/openssl-master/demos/pkcs12/pkwrite.o 

C_DEPS += \
./src/openssl-master/demos/pkcs12/pkread.d \
./src/openssl-master/demos/pkcs12/pkwrite.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/demos/pkcs12/%.o: ../src/openssl-master/demos/pkcs12/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


