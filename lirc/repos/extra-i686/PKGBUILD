# $Id$
# Maintainer: Paul Mattal <paul@archlinux.org>

pkgname=lirc
pkgver=0.8.2
pkgrel=11
_kernver=2.6.24-ARCH
pkgdesc="Linux Infrared Remote Control kernel modules for stock arch kernel"
arch=(i686 x86_64)
license=('GPL')
depends=('lirc-utils' 'kernel26>=2.6.24.3-4' 'kernel26<=2.6.25-0')
makedepends=(help2man)
source=(http://puzzle.dl.sf.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2 \
	kernel-2.6.23.patch kernel-2.6.24.patch)
url="http://www.lirc.org/"
install=$pkgname.install
replaces=('lirc+pctv')

build() {
	# configure
	cd $startdir/src/lirc-$pkgver || return 1
	patch -Np1 -i ../kernel-2.6.23.patch || return 1
	patch -Np1 -i ../kernel-2.6.24.patch || return 1
	./configure --enable-sandboxed --prefix=/usr \
		--with-driver=all --with-kerneldir=/usr/src/linux-${_kernver}/ \
		--with-moduledir=/lib/modules/${_kernver}/kernel/drivers/misc \
		|| return 1

	# disable parallel and bt829
        # because of incompatibility with smp systems
        sed -i -e "s:lirc_parallel::" -e "s:lirc_bt829::" \
		Makefile drivers/Makefile drivers/*/Makefile tools/Makefile \
                || return 1
	# disable lirc_gpio due to brokeness of kernel 2.6.23
	sed -i -e "s:lirc_gpio::" \
		Makefile drivers/Makefile drivers/*/Makefile tools/Makefile \
                || return 1

	# build
	cd drivers || return 1
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1

	# set the kernel we've built for inside the install script
	sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
		$startdir/lirc.install || return 1
}
md5sums=('83e7060a6693b81075c178d7e3b215af'
         '645d016b60bd4e67cc880aba034b1f68'
         '90108e94acc0413f70d83a4d5558757d')
