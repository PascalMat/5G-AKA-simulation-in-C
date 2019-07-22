################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/evp/bio_b64.c \
../src/openssl-master/crypto/evp/bio_enc.c \
../src/openssl-master/crypto/evp/bio_md.c \
../src/openssl-master/crypto/evp/bio_ok.c \
../src/openssl-master/crypto/evp/c_allc.c \
../src/openssl-master/crypto/evp/c_alld.c \
../src/openssl-master/crypto/evp/c_allm.c \
../src/openssl-master/crypto/evp/cmeth_lib.c \
../src/openssl-master/crypto/evp/digest.c \
../src/openssl-master/crypto/evp/e_aes.c \
../src/openssl-master/crypto/evp/e_aes_cbc_hmac_sha1.c \
../src/openssl-master/crypto/evp/e_aes_cbc_hmac_sha256.c \
../src/openssl-master/crypto/evp/e_aria.c \
../src/openssl-master/crypto/evp/e_bf.c \
../src/openssl-master/crypto/evp/e_camellia.c \
../src/openssl-master/crypto/evp/e_cast.c \
../src/openssl-master/crypto/evp/e_chacha20_poly1305.c \
../src/openssl-master/crypto/evp/e_des.c \
../src/openssl-master/crypto/evp/e_des3.c \
../src/openssl-master/crypto/evp/e_idea.c \
../src/openssl-master/crypto/evp/e_null.c \
../src/openssl-master/crypto/evp/e_old.c \
../src/openssl-master/crypto/evp/e_rc2.c \
../src/openssl-master/crypto/evp/e_rc4.c \
../src/openssl-master/crypto/evp/e_rc4_hmac_md5.c \
../src/openssl-master/crypto/evp/e_rc5.c \
../src/openssl-master/crypto/evp/e_seed.c \
../src/openssl-master/crypto/evp/e_sm4.c \
../src/openssl-master/crypto/evp/e_xcbc_d.c \
../src/openssl-master/crypto/evp/encode.c \
../src/openssl-master/crypto/evp/evp_cnf.c \
../src/openssl-master/crypto/evp/evp_enc.c \
../src/openssl-master/crypto/evp/evp_err.c \
../src/openssl-master/crypto/evp/evp_fetch.c \
../src/openssl-master/crypto/evp/evp_key.c \
../src/openssl-master/crypto/evp/evp_lib.c \
../src/openssl-master/crypto/evp/evp_pbe.c \
../src/openssl-master/crypto/evp/evp_pkey.c \
../src/openssl-master/crypto/evp/kdf_lib.c \
../src/openssl-master/crypto/evp/m_md2.c \
../src/openssl-master/crypto/evp/m_md4.c \
../src/openssl-master/crypto/evp/m_md5.c \
../src/openssl-master/crypto/evp/m_md5_sha1.c \
../src/openssl-master/crypto/evp/m_mdc2.c \
../src/openssl-master/crypto/evp/m_null.c \
../src/openssl-master/crypto/evp/m_ripemd.c \
../src/openssl-master/crypto/evp/m_sha1.c \
../src/openssl-master/crypto/evp/m_sha3.c \
../src/openssl-master/crypto/evp/m_sigver.c \
../src/openssl-master/crypto/evp/m_wp.c \
../src/openssl-master/crypto/evp/mac_lib.c \
../src/openssl-master/crypto/evp/names.c \
../src/openssl-master/crypto/evp/p5_crpt.c \
../src/openssl-master/crypto/evp/p5_crpt2.c \
../src/openssl-master/crypto/evp/p_dec.c \
../src/openssl-master/crypto/evp/p_enc.c \
../src/openssl-master/crypto/evp/p_lib.c \
../src/openssl-master/crypto/evp/p_open.c \
../src/openssl-master/crypto/evp/p_seal.c \
../src/openssl-master/crypto/evp/p_sign.c \
../src/openssl-master/crypto/evp/p_verify.c \
../src/openssl-master/crypto/evp/pbe_scrypt.c \
../src/openssl-master/crypto/evp/pkey_kdf.c \
../src/openssl-master/crypto/evp/pkey_mac.c \
../src/openssl-master/crypto/evp/pmeth_fn.c \
../src/openssl-master/crypto/evp/pmeth_gn.c \
../src/openssl-master/crypto/evp/pmeth_lib.c 

OBJS += \
./src/openssl-master/crypto/evp/bio_b64.o \
./src/openssl-master/crypto/evp/bio_enc.o \
./src/openssl-master/crypto/evp/bio_md.o \
./src/openssl-master/crypto/evp/bio_ok.o \
./src/openssl-master/crypto/evp/c_allc.o \
./src/openssl-master/crypto/evp/c_alld.o \
./src/openssl-master/crypto/evp/c_allm.o \
./src/openssl-master/crypto/evp/cmeth_lib.o \
./src/openssl-master/crypto/evp/digest.o \
./src/openssl-master/crypto/evp/e_aes.o \
./src/openssl-master/crypto/evp/e_aes_cbc_hmac_sha1.o \
./src/openssl-master/crypto/evp/e_aes_cbc_hmac_sha256.o \
./src/openssl-master/crypto/evp/e_aria.o \
./src/openssl-master/crypto/evp/e_bf.o \
./src/openssl-master/crypto/evp/e_camellia.o \
./src/openssl-master/crypto/evp/e_cast.o \
./src/openssl-master/crypto/evp/e_chacha20_poly1305.o \
./src/openssl-master/crypto/evp/e_des.o \
./src/openssl-master/crypto/evp/e_des3.o \
./src/openssl-master/crypto/evp/e_idea.o \
./src/openssl-master/crypto/evp/e_null.o \
./src/openssl-master/crypto/evp/e_old.o \
./src/openssl-master/crypto/evp/e_rc2.o \
./src/openssl-master/crypto/evp/e_rc4.o \
./src/openssl-master/crypto/evp/e_rc4_hmac_md5.o \
./src/openssl-master/crypto/evp/e_rc5.o \
./src/openssl-master/crypto/evp/e_seed.o \
./src/openssl-master/crypto/evp/e_sm4.o \
./src/openssl-master/crypto/evp/e_xcbc_d.o \
./src/openssl-master/crypto/evp/encode.o \
./src/openssl-master/crypto/evp/evp_cnf.o \
./src/openssl-master/crypto/evp/evp_enc.o \
./src/openssl-master/crypto/evp/evp_err.o \
./src/openssl-master/crypto/evp/evp_fetch.o \
./src/openssl-master/crypto/evp/evp_key.o \
./src/openssl-master/crypto/evp/evp_lib.o \
./src/openssl-master/crypto/evp/evp_pbe.o \
./src/openssl-master/crypto/evp/evp_pkey.o \
./src/openssl-master/crypto/evp/kdf_lib.o \
./src/openssl-master/crypto/evp/m_md2.o \
./src/openssl-master/crypto/evp/m_md4.o \
./src/openssl-master/crypto/evp/m_md5.o \
./src/openssl-master/crypto/evp/m_md5_sha1.o \
./src/openssl-master/crypto/evp/m_mdc2.o \
./src/openssl-master/crypto/evp/m_null.o \
./src/openssl-master/crypto/evp/m_ripemd.o \
./src/openssl-master/crypto/evp/m_sha1.o \
./src/openssl-master/crypto/evp/m_sha3.o \
./src/openssl-master/crypto/evp/m_sigver.o \
./src/openssl-master/crypto/evp/m_wp.o \
./src/openssl-master/crypto/evp/mac_lib.o \
./src/openssl-master/crypto/evp/names.o \
./src/openssl-master/crypto/evp/p5_crpt.o \
./src/openssl-master/crypto/evp/p5_crpt2.o \
./src/openssl-master/crypto/evp/p_dec.o \
./src/openssl-master/crypto/evp/p_enc.o \
./src/openssl-master/crypto/evp/p_lib.o \
./src/openssl-master/crypto/evp/p_open.o \
./src/openssl-master/crypto/evp/p_seal.o \
./src/openssl-master/crypto/evp/p_sign.o \
./src/openssl-master/crypto/evp/p_verify.o \
./src/openssl-master/crypto/evp/pbe_scrypt.o \
./src/openssl-master/crypto/evp/pkey_kdf.o \
./src/openssl-master/crypto/evp/pkey_mac.o \
./src/openssl-master/crypto/evp/pmeth_fn.o \
./src/openssl-master/crypto/evp/pmeth_gn.o \
./src/openssl-master/crypto/evp/pmeth_lib.o 

C_DEPS += \
./src/openssl-master/crypto/evp/bio_b64.d \
./src/openssl-master/crypto/evp/bio_enc.d \
./src/openssl-master/crypto/evp/bio_md.d \
./src/openssl-master/crypto/evp/bio_ok.d \
./src/openssl-master/crypto/evp/c_allc.d \
./src/openssl-master/crypto/evp/c_alld.d \
./src/openssl-master/crypto/evp/c_allm.d \
./src/openssl-master/crypto/evp/cmeth_lib.d \
./src/openssl-master/crypto/evp/digest.d \
./src/openssl-master/crypto/evp/e_aes.d \
./src/openssl-master/crypto/evp/e_aes_cbc_hmac_sha1.d \
./src/openssl-master/crypto/evp/e_aes_cbc_hmac_sha256.d \
./src/openssl-master/crypto/evp/e_aria.d \
./src/openssl-master/crypto/evp/e_bf.d \
./src/openssl-master/crypto/evp/e_camellia.d \
./src/openssl-master/crypto/evp/e_cast.d \
./src/openssl-master/crypto/evp/e_chacha20_poly1305.d \
./src/openssl-master/crypto/evp/e_des.d \
./src/openssl-master/crypto/evp/e_des3.d \
./src/openssl-master/crypto/evp/e_idea.d \
./src/openssl-master/crypto/evp/e_null.d \
./src/openssl-master/crypto/evp/e_old.d \
./src/openssl-master/crypto/evp/e_rc2.d \
./src/openssl-master/crypto/evp/e_rc4.d \
./src/openssl-master/crypto/evp/e_rc4_hmac_md5.d \
./src/openssl-master/crypto/evp/e_rc5.d \
./src/openssl-master/crypto/evp/e_seed.d \
./src/openssl-master/crypto/evp/e_sm4.d \
./src/openssl-master/crypto/evp/e_xcbc_d.d \
./src/openssl-master/crypto/evp/encode.d \
./src/openssl-master/crypto/evp/evp_cnf.d \
./src/openssl-master/crypto/evp/evp_enc.d \
./src/openssl-master/crypto/evp/evp_err.d \
./src/openssl-master/crypto/evp/evp_fetch.d \
./src/openssl-master/crypto/evp/evp_key.d \
./src/openssl-master/crypto/evp/evp_lib.d \
./src/openssl-master/crypto/evp/evp_pbe.d \
./src/openssl-master/crypto/evp/evp_pkey.d \
./src/openssl-master/crypto/evp/kdf_lib.d \
./src/openssl-master/crypto/evp/m_md2.d \
./src/openssl-master/crypto/evp/m_md4.d \
./src/openssl-master/crypto/evp/m_md5.d \
./src/openssl-master/crypto/evp/m_md5_sha1.d \
./src/openssl-master/crypto/evp/m_mdc2.d \
./src/openssl-master/crypto/evp/m_null.d \
./src/openssl-master/crypto/evp/m_ripemd.d \
./src/openssl-master/crypto/evp/m_sha1.d \
./src/openssl-master/crypto/evp/m_sha3.d \
./src/openssl-master/crypto/evp/m_sigver.d \
./src/openssl-master/crypto/evp/m_wp.d \
./src/openssl-master/crypto/evp/mac_lib.d \
./src/openssl-master/crypto/evp/names.d \
./src/openssl-master/crypto/evp/p5_crpt.d \
./src/openssl-master/crypto/evp/p5_crpt2.d \
./src/openssl-master/crypto/evp/p_dec.d \
./src/openssl-master/crypto/evp/p_enc.d \
./src/openssl-master/crypto/evp/p_lib.d \
./src/openssl-master/crypto/evp/p_open.d \
./src/openssl-master/crypto/evp/p_seal.d \
./src/openssl-master/crypto/evp/p_sign.d \
./src/openssl-master/crypto/evp/p_verify.d \
./src/openssl-master/crypto/evp/pbe_scrypt.d \
./src/openssl-master/crypto/evp/pkey_kdf.d \
./src/openssl-master/crypto/evp/pkey_mac.d \
./src/openssl-master/crypto/evp/pmeth_fn.d \
./src/openssl-master/crypto/evp/pmeth_gn.d \
./src/openssl-master/crypto/evp/pmeth_lib.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/evp/%.o: ../src/openssl-master/crypto/evp/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


