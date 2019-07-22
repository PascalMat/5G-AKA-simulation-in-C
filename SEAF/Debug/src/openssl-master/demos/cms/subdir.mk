################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/demos/cms/cms_comp.c \
../src/openssl-master/demos/cms/cms_ddec.c \
../src/openssl-master/demos/cms/cms_dec.c \
../src/openssl-master/demos/cms/cms_denc.c \
../src/openssl-master/demos/cms/cms_enc.c \
../src/openssl-master/demos/cms/cms_sign.c \
../src/openssl-master/demos/cms/cms_sign2.c \
../src/openssl-master/demos/cms/cms_uncomp.c \
../src/openssl-master/demos/cms/cms_ver.c 

OBJS += \
./src/openssl-master/demos/cms/cms_comp.o \
./src/openssl-master/demos/cms/cms_ddec.o \
./src/openssl-master/demos/cms/cms_dec.o \
./src/openssl-master/demos/cms/cms_denc.o \
./src/openssl-master/demos/cms/cms_enc.o \
./src/openssl-master/demos/cms/cms_sign.o \
./src/openssl-master/demos/cms/cms_sign2.o \
./src/openssl-master/demos/cms/cms_uncomp.o \
./src/openssl-master/demos/cms/cms_ver.o 

C_DEPS += \
./src/openssl-master/demos/cms/cms_comp.d \
./src/openssl-master/demos/cms/cms_ddec.d \
./src/openssl-master/demos/cms/cms_dec.d \
./src/openssl-master/demos/cms/cms_denc.d \
./src/openssl-master/demos/cms/cms_enc.d \
./src/openssl-master/demos/cms/cms_sign.d \
./src/openssl-master/demos/cms/cms_sign2.d \
./src/openssl-master/demos/cms/cms_uncomp.d \
./src/openssl-master/demos/cms/cms_ver.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/demos/cms/%.o: ../src/openssl-master/demos/cms/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


