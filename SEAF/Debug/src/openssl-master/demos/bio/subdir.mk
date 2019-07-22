################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/demos/bio/client-arg.c \
../src/openssl-master/demos/bio/client-conf.c \
../src/openssl-master/demos/bio/saccept.c \
../src/openssl-master/demos/bio/sconnect.c \
../src/openssl-master/demos/bio/server-arg.c \
../src/openssl-master/demos/bio/server-cmod.c \
../src/openssl-master/demos/bio/server-conf.c 

OBJS += \
./src/openssl-master/demos/bio/client-arg.o \
./src/openssl-master/demos/bio/client-conf.o \
./src/openssl-master/demos/bio/saccept.o \
./src/openssl-master/demos/bio/sconnect.o \
./src/openssl-master/demos/bio/server-arg.o \
./src/openssl-master/demos/bio/server-cmod.o \
./src/openssl-master/demos/bio/server-conf.o 

C_DEPS += \
./src/openssl-master/demos/bio/client-arg.d \
./src/openssl-master/demos/bio/client-conf.d \
./src/openssl-master/demos/bio/saccept.d \
./src/openssl-master/demos/bio/sconnect.d \
./src/openssl-master/demos/bio/server-arg.d \
./src/openssl-master/demos/bio/server-cmod.d \
./src/openssl-master/demos/bio/server-conf.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/demos/bio/%.o: ../src/openssl-master/demos/bio/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


