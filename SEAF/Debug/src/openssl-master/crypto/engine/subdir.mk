################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/engine/eng_all.c \
../src/openssl-master/crypto/engine/eng_cnf.c \
../src/openssl-master/crypto/engine/eng_ctrl.c \
../src/openssl-master/crypto/engine/eng_dyn.c \
../src/openssl-master/crypto/engine/eng_err.c \
../src/openssl-master/crypto/engine/eng_fat.c \
../src/openssl-master/crypto/engine/eng_init.c \
../src/openssl-master/crypto/engine/eng_lib.c \
../src/openssl-master/crypto/engine/eng_list.c \
../src/openssl-master/crypto/engine/eng_openssl.c \
../src/openssl-master/crypto/engine/eng_pkey.c \
../src/openssl-master/crypto/engine/eng_rdrand.c \
../src/openssl-master/crypto/engine/eng_table.c \
../src/openssl-master/crypto/engine/tb_asnmth.c \
../src/openssl-master/crypto/engine/tb_cipher.c \
../src/openssl-master/crypto/engine/tb_dh.c \
../src/openssl-master/crypto/engine/tb_digest.c \
../src/openssl-master/crypto/engine/tb_dsa.c \
../src/openssl-master/crypto/engine/tb_eckey.c \
../src/openssl-master/crypto/engine/tb_pkmeth.c \
../src/openssl-master/crypto/engine/tb_rand.c \
../src/openssl-master/crypto/engine/tb_rsa.c 

OBJS += \
./src/openssl-master/crypto/engine/eng_all.o \
./src/openssl-master/crypto/engine/eng_cnf.o \
./src/openssl-master/crypto/engine/eng_ctrl.o \
./src/openssl-master/crypto/engine/eng_dyn.o \
./src/openssl-master/crypto/engine/eng_err.o \
./src/openssl-master/crypto/engine/eng_fat.o \
./src/openssl-master/crypto/engine/eng_init.o \
./src/openssl-master/crypto/engine/eng_lib.o \
./src/openssl-master/crypto/engine/eng_list.o \
./src/openssl-master/crypto/engine/eng_openssl.o \
./src/openssl-master/crypto/engine/eng_pkey.o \
./src/openssl-master/crypto/engine/eng_rdrand.o \
./src/openssl-master/crypto/engine/eng_table.o \
./src/openssl-master/crypto/engine/tb_asnmth.o \
./src/openssl-master/crypto/engine/tb_cipher.o \
./src/openssl-master/crypto/engine/tb_dh.o \
./src/openssl-master/crypto/engine/tb_digest.o \
./src/openssl-master/crypto/engine/tb_dsa.o \
./src/openssl-master/crypto/engine/tb_eckey.o \
./src/openssl-master/crypto/engine/tb_pkmeth.o \
./src/openssl-master/crypto/engine/tb_rand.o \
./src/openssl-master/crypto/engine/tb_rsa.o 

C_DEPS += \
./src/openssl-master/crypto/engine/eng_all.d \
./src/openssl-master/crypto/engine/eng_cnf.d \
./src/openssl-master/crypto/engine/eng_ctrl.d \
./src/openssl-master/crypto/engine/eng_dyn.d \
./src/openssl-master/crypto/engine/eng_err.d \
./src/openssl-master/crypto/engine/eng_fat.d \
./src/openssl-master/crypto/engine/eng_init.d \
./src/openssl-master/crypto/engine/eng_lib.d \
./src/openssl-master/crypto/engine/eng_list.d \
./src/openssl-master/crypto/engine/eng_openssl.d \
./src/openssl-master/crypto/engine/eng_pkey.d \
./src/openssl-master/crypto/engine/eng_rdrand.d \
./src/openssl-master/crypto/engine/eng_table.d \
./src/openssl-master/crypto/engine/tb_asnmth.d \
./src/openssl-master/crypto/engine/tb_cipher.d \
./src/openssl-master/crypto/engine/tb_dh.d \
./src/openssl-master/crypto/engine/tb_digest.d \
./src/openssl-master/crypto/engine/tb_dsa.d \
./src/openssl-master/crypto/engine/tb_eckey.d \
./src/openssl-master/crypto/engine/tb_pkmeth.d \
./src/openssl-master/crypto/engine/tb_rand.d \
./src/openssl-master/crypto/engine/tb_rsa.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/engine/%.o: ../src/openssl-master/crypto/engine/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


