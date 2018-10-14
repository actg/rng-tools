# rng-tools
rng-tools for arm linux (forked from https://github.com/nhorman/rng-tools.git)

As we all know,GNU libc is powerfull but size is very big,so it not suitable for embedded device(ex. router or gateway),so many device used uclibc instead of GNU libc.

the original rng-tools 6.5 is cross compile with arm-linux-gnueabi-gcc(GNU libc),but not build succcessful with arm-linux-gcc(uclibc),because argp.h is error whenver build.


rng-tools是从 https://github.com/nhorman/rng-tools.git 分支而来的，经过二次修改，可以支持uclibc的arm-linux-gcc交叉编译，原版并不支持uclibc，只支持GNU libc，所以在uclibc的平台不能使用。


#### 编译方法
先编译libsysfs库，由于rng-tools需要依赖这个包：
libsysfs下载地址：https://sourceforge.net/projects/linux-diag/files/sysfsutils/2.1.0/sysfsutils-2.1.0.tar.gz/download

#gnuzip sysfsutils-2.1.0.tar.gz
#cd sysfsutils-2.1.0
#./configure --host=arm-linux --prefix=$PWD/install
#make
#make install

#### rngd使用方法：

- 如果你的硬件支持/dev/hwrng硬件真随机数，那么直接运行/sbin/rngd就可以自动默认设置为后台daemon程序，会增加系统的熵值，在很多例如加密的应用中非常有用。

- 如果你的硬件不支持/dev/hwrng真随机数，那么使用linux的伪随机数也可以，使用方法/sbin/rngd -r/dev/urandom

