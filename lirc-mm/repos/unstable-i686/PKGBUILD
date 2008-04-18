# $Id$
# Maintainer: Paul Mattal <paul@archlinux.org>

pkgname=lirc-mm
pkgver=0.8.1
pkgrel=2
_kernver=2.6.22-mm
pkgdesc="Linux Infrared Remote Control kernel modules for kernel26mm."
arch=(i686 x86_64)
depends=('lirc-utils' 'kernel26mm')
makedepends=(help2man)
source=(http://umn.dl.sf.net/sourceforge/lirc/lirc-$pkgver.tar.bz2 kernel-2.6.20.patch)
url="http://www.lirc.org/"
install=lirc.install
replaces=('lirc+pctv')

build() {
	# configure
	cd $startdir/src/lirc-$pkgver || return 1
	patch -Np0 -i ../kernel-2.6.20.patch || return 1
	./configure --enable-sandboxed --prefix=/usr \
		--with-driver=all --with-kerneldir=/usr/src/linux-${_kernver} \
		--with-moduledir=/lib/modules/${_kernver}/kernel/drivers/misc \
		|| return 1

	# disable parallel and bt829
        # because of incompatibility with smp systems
        sed -i -e "s:lirc_parallel::" -e "s:lirc_bt829::" \
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
md5sums=('3a42083fc6c54797351e52c77537c586' '5922c346bbc946a25aa6bdc3f9383308')
