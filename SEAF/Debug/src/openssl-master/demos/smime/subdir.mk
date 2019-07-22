################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/demos/smime/smdec.c \
../src/openssl-master/demos/smime/smenc.c \
../src/openssl-master/demos/smime/smsign.c \
../src/openssl-master/demos/smime/smsign2.c \
../src/openssl-master/demos/smime/smver.c 

OBJS += \
./src/openssl-master/demos/smime/smdec.o \
./src/openssl-master/demos/smime/smenc.o \
./src/openssl-master/demos/smime/smsign.o \
./src/openssl-master/demos/smime/smsign2.o \
./src/openssl-master/demos/smime/smver.o 

C_DEPS += \
./src/openssl-master/demos/smime/smdec.d \
./src/openssl-master/demos/smime/smenc.d \
./src/openssl-master/demos/smime/smsign.d \
./src/openssl-master/demos/smime/smsign2.d \
./src/openssl-master/demos/smime/smver.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/demos/smime/%.o: ../src/openssl-master/demos/smime/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


