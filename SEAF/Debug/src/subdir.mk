################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/AUSF.c \
../src/SEAF.c \
../src/UDM.c \
../src/ffunction.c \
../src/genericFunctions.c \
../src/sidf.c 

OBJS += \
./src/AUSF.o \
./src/SEAF.o \
./src/UDM.o \
./src/ffunction.o \
./src/genericFunctions.o \
./src/sidf.o 

C_DEPS += \
./src/AUSF.d \
./src/SEAF.d \
./src/UDM.d \
./src/ffunction.d \
./src/genericFunctions.d \
./src/sidf.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


