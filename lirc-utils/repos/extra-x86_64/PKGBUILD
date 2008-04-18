# $Id$
# Maintainer: Paul Mattal <paul@archlinux.org>

pkgname=lirc-utils
pkgver=0.8.2
pkgrel=1
pkgdesc="Linux Infrared Remote Control utils"
arch=(i686 x86_64)
license=('GPL')
_kernver=2.6.21-ARCH
depends=('alsa-lib' 'libusb' 'libx11' 'libsm')
makedepends=(help2man)
options=('!libtool')
source=(http://umn.dl.sf.net/sourceforge/lirc/lirc-$pkgver.tar.bz2 \
	lircd lircmd lirc.logrotate lircd.conf.d kernel-2.6.20.patch)
md5sums=('83e7060a6693b81075c178d7e3b215af' 'a454dae4bd8db55e305d5720546b04ae'\
         '85f7fdac55e5256967241864049bf5e9' '3deb02604b37811d41816e9b4385fcc3'\
         '5b1f8c9cd788a39a6283f93302ce5c6e' '5922c346bbc946a25aa6bdc3f9383308')
url="http://www.lirc.org/"
backup=('etc/lircd.conf' 'etc/lircmd.conf'\
        'etc/conf.d/lircd')
replaces=('lirc+pctv')

build() {
	export MAKEFLAGS="-j1"
	# configure
	cd $startdir/src/lirc-$pkgver || return 1
	#patch -Np0 -i ../kernel-2.6.20.patch || return 1
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
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
	mkdir -p $startdir/pkg/usr/share/lirc $startdir/pkg/etc/rc.d \
		|| return 1
	cp $startdir/src/{lircd,lircmd} $startdir/pkg/etc/rc.d/ \
		|| return 1
	cp -rp remotes $startdir/pkg/usr/share/lirc || return 1
	chmod -R go-w $startdir/pkg/usr/share/lirc/ || return 1

	# install the logrotate config
	install -D -m644 $startdir/src/lirc.logrotate \
		$startdir/pkg/etc/logrotate.d/lirc || return 1
	
	# install conf.d file
	install -D -m644 $startdir/src/lircd.conf.d \
		$startdir/pkg/etc/conf.d/lircd || return 1

	# remove built modules
	rm -r $startdir/pkg/lib/
}
