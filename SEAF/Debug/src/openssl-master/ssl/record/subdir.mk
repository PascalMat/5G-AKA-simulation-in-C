################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/ssl/record/dtls1_bitmap.c \
../src/openssl-master/ssl/record/rec_layer_d1.c \
../src/openssl-master/ssl/record/rec_layer_s3.c \
../src/openssl-master/ssl/record/ssl3_buffer.c \
../src/openssl-master/ssl/record/ssl3_record.c \
../src/openssl-master/ssl/record/ssl3_record_tls13.c 

OBJS += \
./src/openssl-master/ssl/record/dtls1_bitmap.o \
./src/openssl-master/ssl/record/rec_layer_d1.o \
./src/openssl-master/ssl/record/rec_layer_s3.o \
./src/openssl-master/ssl/record/ssl3_buffer.o \
./src/openssl-master/ssl/record/ssl3_record.o \
./src/openssl-master/ssl/record/ssl3_record_tls13.o 

C_DEPS += \
./src/openssl-master/ssl/record/dtls1_bitmap.d \
./src/openssl-master/ssl/record/rec_layer_d1.d \
./src/openssl-master/ssl/record/rec_layer_s3.d \
./src/openssl-master/ssl/record/ssl3_buffer.d \
./src/openssl-master/ssl/record/ssl3_record.d \
./src/openssl-master/ssl/record/ssl3_record_tls13.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/ssl/record/%.o: ../src/openssl-master/ssl/record/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


