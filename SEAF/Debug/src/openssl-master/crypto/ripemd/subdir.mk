################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/ripemd/rmd_dgst.c \
../src/openssl-master/crypto/ripemd/rmd_one.c 

OBJS += \
./src/openssl-master/crypto/ripemd/rmd_dgst.o \
./src/openssl-master/crypto/ripemd/rmd_one.o 

C_DEPS += \
./src/openssl-master/crypto/ripemd/rmd_dgst.d \
./src/openssl-master/crypto/ripemd/rmd_one.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/ripemd/%.o: ../src/openssl-master/crypto/ripemd/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


