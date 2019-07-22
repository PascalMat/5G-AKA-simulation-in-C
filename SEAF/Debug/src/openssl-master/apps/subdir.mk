################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/apps/app_rand.c \
../src/openssl-master/apps/apps.c \
../src/openssl-master/apps/apps_ui.c \
../src/openssl-master/apps/asn1pars.c \
../src/openssl-master/apps/bf_prefix.c \
../src/openssl-master/apps/ca.c \
../src/openssl-master/apps/ciphers.c \
../src/openssl-master/apps/cms.c \
../src/openssl-master/apps/crl.c \
../src/openssl-master/apps/crl2p7.c \
../src/openssl-master/apps/dgst.c \
../src/openssl-master/apps/dhparam.c \
../src/openssl-master/apps/dsa.c \
../src/openssl-master/apps/dsaparam.c \
../src/openssl-master/apps/ec.c \
../src/openssl-master/apps/ecparam.c \
../src/openssl-master/apps/enc.c \
../src/openssl-master/apps/engine.c \
../src/openssl-master/apps/errstr.c \
../src/openssl-master/apps/fmt.c \
../src/openssl-master/apps/gendsa.c \
../src/openssl-master/apps/genpkey.c \
../src/openssl-master/apps/genrsa.c \
../src/openssl-master/apps/mac.c \
../src/openssl-master/apps/nseq.c \
../src/openssl-master/apps/ocsp.c \
../src/openssl-master/apps/openssl.c \
../src/openssl-master/apps/opt.c \
../src/openssl-master/apps/passwd.c \
../src/openssl-master/apps/pkcs12.c \
../src/openssl-master/apps/pkcs7.c \
../src/openssl-master/apps/pkcs8.c \
../src/openssl-master/apps/pkey.c \
../src/openssl-master/apps/pkeyparam.c \
../src/openssl-master/apps/pkeyutl.c \
../src/openssl-master/apps/prime.c \
../src/openssl-master/apps/rand.c \
../src/openssl-master/apps/rehash.c \
../src/openssl-master/apps/req.c \
../src/openssl-master/apps/rsa.c \
../src/openssl-master/apps/rsautl.c \
../src/openssl-master/apps/s_cb.c \
../src/openssl-master/apps/s_client.c \
../src/openssl-master/apps/s_server.c \
../src/openssl-master/apps/s_socket.c \
../src/openssl-master/apps/s_time.c \
../src/openssl-master/apps/sess_id.c \
../src/openssl-master/apps/smime.c \
../src/openssl-master/apps/speed.c \
../src/openssl-master/apps/spkac.c \
../src/openssl-master/apps/srp.c \
../src/openssl-master/apps/storeutl.c \
../src/openssl-master/apps/ts.c \
../src/openssl-master/apps/verify.c \
../src/openssl-master/apps/version.c \
../src/openssl-master/apps/vms_decc_argv.c \
../src/openssl-master/apps/vms_decc_init.c \
../src/openssl-master/apps/vms_term_sock.c \
../src/openssl-master/apps/win32_init.c \
../src/openssl-master/apps/x509.c 

OBJS += \
./src/openssl-master/apps/app_rand.o \
./src/openssl-master/apps/apps.o \
./src/openssl-master/apps/apps_ui.o \
./src/openssl-master/apps/asn1pars.o \
./src/openssl-master/apps/bf_prefix.o \
./src/openssl-master/apps/ca.o \
./src/openssl-master/apps/ciphers.o \
./src/openssl-master/apps/cms.o \
./src/openssl-master/apps/crl.o \
./src/openssl-master/apps/crl2p7.o \
./src/openssl-master/apps/dgst.o \
./src/openssl-master/apps/dhparam.o \
./src/openssl-master/apps/dsa.o \
./src/openssl-master/apps/dsaparam.o \
./src/openssl-master/apps/ec.o \
./src/openssl-master/apps/ecparam.o \
./src/openssl-master/apps/enc.o \
./src/openssl-master/apps/engine.o \
./src/openssl-master/apps/errstr.o \
./src/openssl-master/apps/fmt.o \
./src/openssl-master/apps/gendsa.o \
./src/openssl-master/apps/genpkey.o \
./src/openssl-master/apps/genrsa.o \
./src/openssl-master/apps/mac.o \
./src/openssl-master/apps/nseq.o \
./src/openssl-master/apps/ocsp.o \
./src/openssl-master/apps/openssl.o \
./src/openssl-master/apps/opt.o \
./src/openssl-master/apps/passwd.o \
./src/openssl-master/apps/pkcs12.o \
./src/openssl-master/apps/pkcs7.o \
./src/openssl-master/apps/pkcs8.o \
./src/openssl-master/apps/pkey.o \
./src/openssl-master/apps/pkeyparam.o \
./src/openssl-master/apps/pkeyutl.o \
./src/openssl-master/apps/prime.o \
./src/openssl-master/apps/rand.o \
./src/openssl-master/apps/rehash.o \
./src/openssl-master/apps/req.o \
./src/openssl-master/apps/rsa.o \
./src/openssl-master/apps/rsautl.o \
./src/openssl-master/apps/s_cb.o \
./src/openssl-master/apps/s_client.o \
./src/openssl-master/apps/s_server.o \
./src/openssl-master/apps/s_socket.o \
./src/openssl-master/apps/s_time.o \
./src/openssl-master/apps/sess_id.o \
./src/openssl-master/apps/smime.o \
./src/openssl-master/apps/speed.o \
./src/openssl-master/apps/spkac.o \
./src/openssl-master/apps/srp.o \
./src/openssl-master/apps/storeutl.o \
./src/openssl-master/apps/ts.o \
./src/openssl-master/apps/verify.o \
./src/openssl-master/apps/version.o \
./src/openssl-master/apps/vms_decc_argv.o \
./src/openssl-master/apps/vms_decc_init.o \
./src/openssl-master/apps/vms_term_sock.o \
./src/openssl-master/apps/win32_init.o \
./src/openssl-master/apps/x509.o 

C_DEPS += \
./src/openssl-master/apps/app_rand.d \
./src/openssl-master/apps/apps.d \
./src/openssl-master/apps/apps_ui.d \
./src/openssl-master/apps/asn1pars.d \
./src/openssl-master/apps/bf_prefix.d \
./src/openssl-master/apps/ca.d \
./src/openssl-master/apps/ciphers.d \
./src/openssl-master/apps/cms.d \
./src/openssl-master/apps/crl.d \
./src/openssl-master/apps/crl2p7.d \
./src/openssl-master/apps/dgst.d \
./src/openssl-master/apps/dhparam.d \
./src/openssl-master/apps/dsa.d \
./src/openssl-master/apps/dsaparam.d \
./src/openssl-master/apps/ec.d \
./src/openssl-master/apps/ecparam.d \
./src/openssl-master/apps/enc.d \
./src/openssl-master/apps/engine.d \
./src/openssl-master/apps/errstr.d \
./src/openssl-master/apps/fmt.d \
./src/openssl-master/apps/gendsa.d \
./src/openssl-master/apps/genpkey.d \
./src/openssl-master/apps/genrsa.d \
./src/openssl-master/apps/mac.d \
./src/openssl-master/apps/nseq.d \
./src/openssl-master/apps/ocsp.d \
./src/openssl-master/apps/openssl.d \
./src/openssl-master/apps/opt.d \
./src/openssl-master/apps/passwd.d \
./src/openssl-master/apps/pkcs12.d \
./src/openssl-master/apps/pkcs7.d \
./src/openssl-master/apps/pkcs8.d \
./src/openssl-master/apps/pkey.d \
./src/openssl-master/apps/pkeyparam.d \
./src/openssl-master/apps/pkeyutl.d \
./src/openssl-master/apps/prime.d \
./src/openssl-master/apps/rand.d \
./src/openssl-master/apps/rehash.d \
./src/openssl-master/apps/req.d \
./src/openssl-master/apps/rsa.d \
./src/openssl-master/apps/rsautl.d \
./src/openssl-master/apps/s_cb.d \
./src/openssl-master/apps/s_client.d \
./src/openssl-master/apps/s_server.d \
./src/openssl-master/apps/s_socket.d \
./src/openssl-master/apps/s_time.d \
./src/openssl-master/apps/sess_id.d \
./src/openssl-master/apps/smime.d \
./src/openssl-master/apps/speed.d \
./src/openssl-master/apps/spkac.d \
./src/openssl-master/apps/srp.d \
./src/openssl-master/apps/storeutl.d \
./src/openssl-master/apps/ts.d \
./src/openssl-master/apps/verify.d \
./src/openssl-master/apps/version.d \
./src/openssl-master/apps/vms_decc_argv.d \
./src/openssl-master/apps/vms_decc_init.d \
./src/openssl-master/apps/vms_term_sock.d \
./src/openssl-master/apps/win32_init.d \
./src/openssl-master/apps/x509.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/apps/%.o: ../src/openssl-master/apps/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


