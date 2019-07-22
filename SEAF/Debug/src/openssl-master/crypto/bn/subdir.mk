################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/bn/bn_add.c \
../src/openssl-master/crypto/bn/bn_asm.c \
../src/openssl-master/crypto/bn/bn_blind.c \
../src/openssl-master/crypto/bn/bn_const.c \
../src/openssl-master/crypto/bn/bn_ctx.c \
../src/openssl-master/crypto/bn/bn_depr.c \
../src/openssl-master/crypto/bn/bn_dh.c \
../src/openssl-master/crypto/bn/bn_div.c \
../src/openssl-master/crypto/bn/bn_err.c \
../src/openssl-master/crypto/bn/bn_exp.c \
../src/openssl-master/crypto/bn/bn_exp2.c \
../src/openssl-master/crypto/bn/bn_gcd.c \
../src/openssl-master/crypto/bn/bn_gf2m.c \
../src/openssl-master/crypto/bn/bn_intern.c \
../src/openssl-master/crypto/bn/bn_kron.c \
../src/openssl-master/crypto/bn/bn_lib.c \
../src/openssl-master/crypto/bn/bn_mod.c \
../src/openssl-master/crypto/bn/bn_mont.c \
../src/openssl-master/crypto/bn/bn_mpi.c \
../src/openssl-master/crypto/bn/bn_mul.c \
../src/openssl-master/crypto/bn/bn_nist.c \
../src/openssl-master/crypto/bn/bn_prime.c \
../src/openssl-master/crypto/bn/bn_print.c \
../src/openssl-master/crypto/bn/bn_rand.c \
../src/openssl-master/crypto/bn/bn_recp.c \
../src/openssl-master/crypto/bn/bn_rsa_fips186_4.c \
../src/openssl-master/crypto/bn/bn_shift.c \
../src/openssl-master/crypto/bn/bn_sqr.c \
../src/openssl-master/crypto/bn/bn_sqrt.c \
../src/openssl-master/crypto/bn/bn_srp.c \
../src/openssl-master/crypto/bn/bn_word.c \
../src/openssl-master/crypto/bn/bn_x931p.c \
../src/openssl-master/crypto/bn/rsaz_exp.c 

OBJS += \
./src/openssl-master/crypto/bn/bn_add.o \
./src/openssl-master/crypto/bn/bn_asm.o \
./src/openssl-master/crypto/bn/bn_blind.o \
./src/openssl-master/crypto/bn/bn_const.o \
./src/openssl-master/crypto/bn/bn_ctx.o \
./src/openssl-master/crypto/bn/bn_depr.o \
./src/openssl-master/crypto/bn/bn_dh.o \
./src/openssl-master/crypto/bn/bn_div.o \
./src/openssl-master/crypto/bn/bn_err.o \
./src/openssl-master/crypto/bn/bn_exp.o \
./src/openssl-master/crypto/bn/bn_exp2.o \
./src/openssl-master/crypto/bn/bn_gcd.o \
./src/openssl-master/crypto/bn/bn_gf2m.o \
./src/openssl-master/crypto/bn/bn_intern.o \
./src/openssl-master/crypto/bn/bn_kron.o \
./src/openssl-master/crypto/bn/bn_lib.o \
./src/openssl-master/crypto/bn/bn_mod.o \
./src/openssl-master/crypto/bn/bn_mont.o \
./src/openssl-master/crypto/bn/bn_mpi.o \
./src/openssl-master/crypto/bn/bn_mul.o \
./src/openssl-master/crypto/bn/bn_nist.o \
./src/openssl-master/crypto/bn/bn_prime.o \
./src/openssl-master/crypto/bn/bn_print.o \
./src/openssl-master/crypto/bn/bn_rand.o \
./src/openssl-master/crypto/bn/bn_recp.o \
./src/openssl-master/crypto/bn/bn_rsa_fips186_4.o \
./src/openssl-master/crypto/bn/bn_shift.o \
./src/openssl-master/crypto/bn/bn_sqr.o \
./src/openssl-master/crypto/bn/bn_sqrt.o \
./src/openssl-master/crypto/bn/bn_srp.o \
./src/openssl-master/crypto/bn/bn_word.o \
./src/openssl-master/crypto/bn/bn_x931p.o \
./src/openssl-master/crypto/bn/rsaz_exp.o 

C_DEPS += \
./src/openssl-master/crypto/bn/bn_add.d \
./src/openssl-master/crypto/bn/bn_asm.d \
./src/openssl-master/crypto/bn/bn_blind.d \
./src/openssl-master/crypto/bn/bn_const.d \
./src/openssl-master/crypto/bn/bn_ctx.d \
./src/openssl-master/crypto/bn/bn_depr.d \
./src/openssl-master/crypto/bn/bn_dh.d \
./src/openssl-master/crypto/bn/bn_div.d \
./src/openssl-master/crypto/bn/bn_err.d \
./src/openssl-master/crypto/bn/bn_exp.d \
./src/openssl-master/crypto/bn/bn_exp2.d \
./src/openssl-master/crypto/bn/bn_gcd.d \
./src/openssl-master/crypto/bn/bn_gf2m.d \
./src/openssl-master/crypto/bn/bn_intern.d \
./src/openssl-master/crypto/bn/bn_kron.d \
./src/openssl-master/crypto/bn/bn_lib.d \
./src/openssl-master/crypto/bn/bn_mod.d \
./src/openssl-master/crypto/bn/bn_mont.d \
./src/openssl-master/crypto/bn/bn_mpi.d \
./src/openssl-master/crypto/bn/bn_mul.d \
./src/openssl-master/crypto/bn/bn_nist.d \
./src/openssl-master/crypto/bn/bn_prime.d \
./src/openssl-master/crypto/bn/bn_print.d \
./src/openssl-master/crypto/bn/bn_rand.d \
./src/openssl-master/crypto/bn/bn_recp.d \
./src/openssl-master/crypto/bn/bn_rsa_fips186_4.d \
./src/openssl-master/crypto/bn/bn_shift.d \
./src/openssl-master/crypto/bn/bn_sqr.d \
./src/openssl-master/crypto/bn/bn_sqrt.d \
./src/openssl-master/crypto/bn/bn_srp.d \
./src/openssl-master/crypto/bn/bn_word.d \
./src/openssl-master/crypto/bn/bn_x931p.d \
./src/openssl-master/crypto/bn/rsaz_exp.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/bn/%.o: ../src/openssl-master/crypto/bn/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


