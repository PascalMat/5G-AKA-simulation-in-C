################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/UE.c \
../src/USIM.c \
../src/connection_layer.c \
../src/ffunction.c \
../src/genericFunctions.c 

OBJS += \
./src/UE.o \
./src/USIM.o \
./src/connection_layer.o \
./src/ffunction.o \
./src/genericFunctions.o 

C_DEPS += \
./src/UE.d \
./src/USIM.d \
./src/connection_layer.d \
./src/ffunction.d \
./src/genericFunctions.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


