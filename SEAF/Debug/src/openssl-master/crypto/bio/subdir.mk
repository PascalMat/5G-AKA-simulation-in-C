################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/openssl-master/crypto/bio/b_addr.c \
../src/openssl-master/crypto/bio/b_dump.c \
../src/openssl-master/crypto/bio/b_print.c \
../src/openssl-master/crypto/bio/b_sock.c \
../src/openssl-master/crypto/bio/b_sock2.c \
../src/openssl-master/crypto/bio/bf_buff.c \
../src/openssl-master/crypto/bio/bf_lbuf.c \
../src/openssl-master/crypto/bio/bf_nbio.c \
../src/openssl-master/crypto/bio/bf_null.c \
../src/openssl-master/crypto/bio/bio_cb.c \
../src/openssl-master/crypto/bio/bio_err.c \
../src/openssl-master/crypto/bio/bio_lib.c \
../src/openssl-master/crypto/bio/bio_meth.c \
../src/openssl-master/crypto/bio/bss_acpt.c \
../src/openssl-master/crypto/bio/bss_bio.c \
../src/openssl-master/crypto/bio/bss_conn.c \
../src/openssl-master/crypto/bio/bss_dgram.c \
../src/openssl-master/crypto/bio/bss_fd.c \
../src/openssl-master/crypto/bio/bss_file.c \
../src/openssl-master/crypto/bio/bss_log.c \
../src/openssl-master/crypto/bio/bss_mem.c \
../src/openssl-master/crypto/bio/bss_null.c \
../src/openssl-master/crypto/bio/bss_sock.c 

OBJS += \
./src/openssl-master/crypto/bio/b_addr.o \
./src/openssl-master/crypto/bio/b_dump.o \
./src/openssl-master/crypto/bio/b_print.o \
./src/openssl-master/crypto/bio/b_sock.o \
./src/openssl-master/crypto/bio/b_sock2.o \
./src/openssl-master/crypto/bio/bf_buff.o \
./src/openssl-master/crypto/bio/bf_lbuf.o \
./src/openssl-master/crypto/bio/bf_nbio.o \
./src/openssl-master/crypto/bio/bf_null.o \
./src/openssl-master/crypto/bio/bio_cb.o \
./src/openssl-master/crypto/bio/bio_err.o \
./src/openssl-master/crypto/bio/bio_lib.o \
./src/openssl-master/crypto/bio/bio_meth.o \
./src/openssl-master/crypto/bio/bss_acpt.o \
./src/openssl-master/crypto/bio/bss_bio.o \
./src/openssl-master/crypto/bio/bss_conn.o \
./src/openssl-master/crypto/bio/bss_dgram.o \
./src/openssl-master/crypto/bio/bss_fd.o \
./src/openssl-master/crypto/bio/bss_file.o \
./src/openssl-master/crypto/bio/bss_log.o \
./src/openssl-master/crypto/bio/bss_mem.o \
./src/openssl-master/crypto/bio/bss_null.o \
./src/openssl-master/crypto/bio/bss_sock.o 

C_DEPS += \
./src/openssl-master/crypto/bio/b_addr.d \
./src/openssl-master/crypto/bio/b_dump.d \
./src/openssl-master/crypto/bio/b_print.d \
./src/openssl-master/crypto/bio/b_sock.d \
./src/openssl-master/crypto/bio/b_sock2.d \
./src/openssl-master/crypto/bio/bf_buff.d \
./src/openssl-master/crypto/bio/bf_lbuf.d \
./src/openssl-master/crypto/bio/bf_nbio.d \
./src/openssl-master/crypto/bio/bf_null.d \
./src/openssl-master/crypto/bio/bio_cb.d \
./src/openssl-master/crypto/bio/bio_err.d \
./src/openssl-master/crypto/bio/bio_lib.d \
./src/openssl-master/crypto/bio/bio_meth.d \
./src/openssl-master/crypto/bio/bss_acpt.d \
./src/openssl-master/crypto/bio/bss_bio.d \
./src/openssl-master/crypto/bio/bss_conn.d \
./src/openssl-master/crypto/bio/bss_dgram.d \
./src/openssl-master/crypto/bio/bss_fd.d \
./src/openssl-master/crypto/bio/bss_file.d \
./src/openssl-master/crypto/bio/bss_log.d \
./src/openssl-master/crypto/bio/bss_mem.d \
./src/openssl-master/crypto/bio/bss_null.d \
./src/openssl-master/crypto/bio/bss_sock.d 


# Each subdirectory must supply rules for building sources it contributes
src/openssl-master/crypto/bio/%.o: ../src/openssl-master/crypto/bio/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


