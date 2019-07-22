################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/ec/curve25519.c \
../src/openssl-master/crypto/ec/ec2_oct.c \
../src/openssl-master/crypto/ec/ec2_smpl.c \
../src/openssl-master/crypto/ec/ec_ameth.c \
../src/openssl-master/crypto/ec/ec_asn1.c \
../src/openssl-master/crypto/ec/ec_check.c \
../src/openssl-master/crypto/ec/ec_curve.c \
../src/openssl-master/crypto/ec/ec_cvt.c \
../src/openssl-master/crypto/ec/ec_err.c \
../src/openssl-master/crypto/ec/ec_key.c \
../src/openssl-master/crypto/ec/ec_kmeth.c \
../src/openssl-master/crypto/ec/ec_lib.c \
../src/openssl-master/crypto/ec/ec_mult.c \
../src/openssl-master/crypto/ec/ec_oct.c \
../src/openssl-master/crypto/ec/ec_pmeth.c \
../src/openssl-master/crypto/ec/ec_print.c \
../src/openssl-master/crypto/ec/ecdh_kdf.c \
../src/openssl-master/crypto/ec/ecdh_ossl.c \
../src/openssl-master/crypto/ec/ecdsa_ossl.c \
../src/openssl-master/crypto/ec/ecdsa_sign.c \
../src/openssl-master/crypto/ec/ecdsa_vrf.c \
../src/openssl-master/crypto/ec/eck_prn.c \
../src/openssl-master/crypto/ec/ecp_mont.c \
../src/openssl-master/crypto/ec/ecp_nist.c \
../src/openssl-master/crypto/ec/ecp_nistp224.c \
../src/openssl-master/crypto/ec/ecp_nistp256.c \
../src/openssl-master/crypto/ec/ecp_nistp521.c \
../src/openssl-master/crypto/ec/ecp_nistputil.c \
../src/openssl-master/crypto/ec/ecp_nistz256.c \
../src/openssl-master/crypto/ec/ecp_nistz256_table.c \
../src/openssl-master/crypto/ec/ecp_oct.c \
../src/openssl-master/crypto/ec/ecp_smpl.c \
../src/openssl-master/crypto/ec/ecx_meth.c 

OBJS += \
./src/openssl-master/crypto/ec/curve25519.o \
./src/openssl-master/crypto/ec/ec2_oct.o \
./src/openssl-master/crypto/ec/ec2_smpl.o \
./src/openssl-master/crypto/ec/ec_ameth.o \
./src/openssl-master/crypto/ec/ec_asn1.o \
./src/openssl-master/crypto/ec/ec_check.o \
./src/openssl-master/crypto/ec/ec_curve.o \
./src/openssl-master/crypto/ec/ec_cvt.o \
./src/openssl-master/crypto/ec/ec_err.o \
./src/openssl-master/crypto/ec/ec_key.o \
./src/openssl-master/crypto/ec/ec_kmeth.o \
./src/openssl-master/crypto/ec/ec_lib.o \
./src/openssl-master/crypto/ec/ec_mult.o \
./src/openssl-master/crypto/ec/ec_oct.o \
./src/openssl-master/crypto/ec/ec_pmeth.o \
./src/openssl-master/crypto/ec/ec_print.o \
./src/openssl-master/crypto/ec/ecdh_kdf.o \
./src/openssl-master/crypto/ec/ecdh_ossl.o \
./src/openssl-master/crypto/ec/ecdsa_ossl.o \
./src/openssl-master/crypto/ec/ecdsa_sign.o \
./src/openssl-master/crypto/ec/ecdsa_vrf.o \
./src/openssl-master/crypto/ec/eck_prn.o \
./src/openssl-master/crypto/ec/ecp_mont.o \
./src/openssl-master/crypto/ec/ecp_nist.o \
./src/openssl-master/crypto/ec/ecp_nistp224.o \
./src/openssl-master/crypto/ec/ecp_nistp256.o \
./src/openssl-master/crypto/ec/ecp_nistp521.o \
./src/openssl-master/crypto/ec/ecp_nistputil.o \
./src/openssl-master/crypto/ec/ecp_nistz256.o \
./src/openssl-master/crypto/ec/ecp_nistz256_table.o \
./src/openssl-master/crypto/ec/ecp_oct.o \
./src/openssl-master/crypto/ec/ecp_smpl.o \
./src/openssl-master/crypto/ec/ecx_meth.o 

C_DEPS += \
./src/openssl-master/crypto/ec/curve25519.d \
./src/openssl-master/crypto/ec/ec2_oct.d \
./src/openssl-master/crypto/ec/ec2_smpl.d \
./src/openssl-master/crypto/ec/ec_ameth.d \
./src/openssl-master/crypto/ec/ec_asn1.d \
./src/openssl-master/crypto/ec/ec_check.d \
./src/openssl-master/crypto/ec/ec_curve.d \
./src/openssl-master/crypto/ec/ec_cvt.d \
./src/openssl-master/crypto/ec/ec_err.d \
./src/openssl-master/crypto/ec/ec_key.d \
./src/openssl-master/crypto/ec/ec_kmeth.d \
./src/openssl-master/crypto/ec/ec_lib.d \
./src/openssl-master/crypto/ec/ec_mult.d \
./src/openssl-master/crypto/ec/ec_oct.d \
./src/openssl-master/crypto/ec/ec_pmeth.d \
./src/openssl-master/crypto/ec/ec_print.d \
./src/openssl-master/crypto/ec/ecdh_kdf.d \
./src/openssl-master/crypto/ec/ecdh_ossl.d \
./src/openssl-master/crypto/ec/ecdsa_ossl.d \
./src/openssl-master/crypto/ec/ecdsa_sign.d \
./src/openssl-master/crypto/ec/ecdsa_vrf.d \
./src/openssl-master/crypto/ec/eck_prn.d \
./src/openssl-master/crypto/ec/ecp_mont.d \
./src/openssl-master/crypto/ec/ecp_nist.d \
./src/openssl-master/crypto/ec/ecp_nistp224.d \
./src/openssl-master/crypto/ec/ecp_nistp256.d \
./src/openssl-master/crypto/ec/ecp_nistp521.d \
./src/openssl-master/crypto/ec/ecp_nistputil.d \
./src/openssl-master/crypto/ec/ecp_nistz256.d \
./src/openssl-master/crypto/ec/ecp_nistz256_table.d \
./src/openssl-master/crypto/ec/ecp_oct.d \
./src/openssl-master/crypto/ec/ecp_smpl.d \
./src/openssl-master/crypto/ec/ecx_meth.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/ec/%.o: ../src/openssl-master/crypto/ec/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


