################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/objects/o_names.c \
../src/openssl-master/crypto/objects/obj_dat.c \
../src/openssl-master/crypto/objects/obj_err.c \
../src/openssl-master/crypto/objects/obj_lib.c \
../src/openssl-master/crypto/objects/obj_xref.c 

OBJS += \
./src/openssl-master/crypto/objects/o_names.o \
./src/openssl-master/crypto/objects/obj_dat.o \
./src/openssl-master/crypto/objects/obj_err.o \
./src/openssl-master/crypto/objects/obj_lib.o \
./src/openssl-master/crypto/objects/obj_xref.o 

C_DEPS += \
./src/openssl-master/crypto/objects/o_names.d \
./src/openssl-master/crypto/objects/obj_dat.d \
./src/openssl-master/crypto/objects/obj_err.d \
./src/openssl-master/crypto/objects/obj_lib.d \
./src/openssl-master/crypto/objects/obj_xref.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/objects/%.o: ../src/openssl-master/crypto/objects/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


