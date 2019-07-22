################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../src/openssl-master/crypto/bn/asm/bn-c64xplus.asm 

C_SRCS += \
../src/openssl-master/crypto/bn/asm/x86_64-gcc.c 

S_UPPER_SRCS += \
../src/openssl-master/crypto/bn/asm/ia64.S \
../src/openssl-master/crypto/bn/asm/s390x.S \
../src/openssl-master/crypto/bn/asm/sparcv8.S \
../src/openssl-master/crypto/bn/asm/sparcv8plus.S 

OBJS += \
./src/openssl-master/crypto/bn/asm/bn-c64xplus.o \
./src/openssl-master/crypto/bn/asm/ia64.o \
./src/openssl-master/crypto/bn/asm/s390x.o \
./src/openssl-master/crypto/bn/asm/sparcv8.o \
./src/openssl-master/crypto/bn/asm/sparcv8plus.o \
./src/openssl-master/crypto/bn/asm/x86_64-gcc.o 

C_DEPS += \
./src/openssl-master/crypto/bn/asm/x86_64-gcc.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/bn/asm/%.o: ../src/openssl-master/crypto/bn/asm/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/openssl-master/crypto/bn/asm/%.o: ../src/openssl-master/crypto/bn/asm/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: GCC Assembler'
	as  -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/openssl-master/crypto/bn/asm/%.o: ../src/openssl-master/crypto/bn/asm/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


