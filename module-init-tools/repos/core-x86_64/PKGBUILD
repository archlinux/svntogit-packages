# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=module-init-tools
pkgver=3.2.2
pkgrel=6
pkgdesc="Utilities for inserting and removing modules from the Linux kernel"
arch=(i686 x86_64)
url="http://www.kernel.org"
license=('GPL')
groups=('base')
depends=('glibc')
conflicts=('modutils')
replaces=('modutils')
backup=('etc/modprobe.conf' 'etc/modules.conf' 'etc/modprobe.devfs')
source=(http://www.kernel.org/pub/linux/utils/kernel/module-init-tools/module-init-tools-$pkgver.tar.bz2 \
	makefile.patch modprobe.conf fix-modprobe-ignore-path.patch)

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../makefile.patch || return 1
  patch -Np0 -i ../fix-modprobe-ignore-path.patch || return 1
  sed -i 's|/usr/bin/install|/bin/install|g' install-with-care
  ./configure --prefix=/usr --exec-prefix=/
  make || return 1
  INSTALL=/bin/install make DESTDIR=$startdir/pkg install
  install -D -m644 ../modprobe.conf $startdir/pkg/etc/modprobe.conf
}
