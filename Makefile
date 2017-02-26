obj-m	:= helloworld.o

KARCH	:= x86
KDIR	:= ~/OpenWrt-SDK-15.05.1-x86-generic_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64/build_dir/target-i386_i486_uClibc-0.9.33.2/linux-x86_generic/linux-3.18.23
PWD		:= $(shell pwd)

all:
	cp -n $(KDIR)/include/linux/compiler-gcc5.h $(KDIR)/include/linux/compiler-gcc6.h
	
	$(MAKE) -C $(KDIR) ARCH=$(KARCH) M=$(PWD) modules
	
clean:
	rm *.mod.c *.ko *.o Module.symvers modules.order -f