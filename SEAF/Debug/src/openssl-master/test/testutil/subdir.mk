################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/test/testutil/apps_mem.c \
../src/openssl-master/test/testutil/basic_output.c \
../src/openssl-master/test/testutil/cb.c \
../src/openssl-master/test/testutil/driver.c \
../src/openssl-master/test/testutil/format_output.c \
../src/openssl-master/test/testutil/init.c \
../src/openssl-master/test/testutil/main.c \
../src/openssl-master/test/testutil/options.c \
../src/openssl-master/test/testutil/output_helpers.c \
../src/openssl-master/test/testutil/stanza.c \
../src/openssl-master/test/testutil/tap_bio.c \
../src/openssl-master/test/testutil/test_cleanup.c \
../src/openssl-master/test/testutil/test_options.c \
../src/openssl-master/test/testutil/tests.c 

OBJS += \
./src/openssl-master/test/testutil/apps_mem.o \
./src/openssl-master/test/testutil/basic_output.o \
./src/openssl-master/test/testutil/cb.o \
./src/openssl-master/test/testutil/driver.o \
./src/openssl-master/test/testutil/format_output.o \
./src/openssl-master/test/testutil/init.o \
./src/openssl-master/test/testutil/main.o \
./src/openssl-master/test/testutil/options.o \
./src/openssl-master/test/testutil/output_helpers.o \
./src/openssl-master/test/testutil/stanza.o \
./src/openssl-master/test/testutil/tap_bio.o \
./src/openssl-master/test/testutil/test_cleanup.o \
./src/openssl-master/test/testutil/test_options.o \
./src/openssl-master/test/testutil/tests.o 

C_DEPS += \
./src/openssl-master/test/testutil/apps_mem.d \
./src/openssl-master/test/testutil/basic_output.d \
./src/openssl-master/test/testutil/cb.d \
./src/openssl-master/test/testutil/driver.d \
./src/openssl-master/test/testutil/format_output.d \
./src/openssl-master/test/testutil/init.d \
./src/openssl-master/test/testutil/main.d \
./src/openssl-master/test/testutil/options.d \
./src/openssl-master/test/testutil/output_helpers.d \
./src/openssl-master/test/testutil/stanza.d \
./src/openssl-master/test/testutil/tap_bio.d \
./src/openssl-master/test/testutil/test_cleanup.d \
./src/openssl-master/test/testutil/test_options.d \
./src/openssl-master/test/testutil/tests.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/test/testutil/%.o: ../src/openssl-master/test/testutil/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


