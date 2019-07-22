################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/md2/md2_dgst.c \
../src/openssl-master/crypto/md2/md2_one.c 

OBJS += \
./src/openssl-master/crypto/md2/md2_dgst.o \
./src/openssl-master/crypto/md2/md2_one.o 

C_DEPS += \
./src/openssl-master/crypto/md2/md2_dgst.d \
./src/openssl-master/crypto/md2/md2_one.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/md2/%.o: ../src/openssl-master/crypto/md2/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


