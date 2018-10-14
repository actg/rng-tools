# rng-tools
rng-tools for arm linux (based uclibc，not gnu libc)

As we all know,gnu libc is powerfull but size is very big,so it not suitable for embedded device(ex. router or gateway).

rng-tools 6.5 is only cross compile with arm-linux-gnueabi-gcc(gnu libc),but not build succcess with arm-linux-gcc(uclibc),because argp.h is error whenver build.
