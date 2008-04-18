# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
pkgname=device-mapper
pkgver=1.02.24
pkgrel=1
pkgdesc="Device mapper userspace library and tools."
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceware.org/dm/"
groups=('base')
depends=('glibc')
source=(ftp://sources.redhat.com/pub/dm/device-mapper.$pkgver.tgz
	device-mapper.rules)
md5sums=('44420c94a412323da9d8b1ce21f2bebd'
         '065f32a36947e6183722ed9aef13dc0c')

build() {
  cd $startdir/src/$pkgname.$pkgver
  ./configure --prefix=/usr 
  make || return 1
  make DESTDIR=$startdir/pkg sbindir=$startdir/pkg/sbin \
    libdir=$startdir/pkg/lib install

  # install the static library as well
  install -D -m644 lib/ioctl/libdevmapper.a $startdir/pkg/usr/lib/libdevmapper.a
  # install udev rule
  install -D -m644 $startdir/src/device-mapper.rules $startdir/pkg/etc/udev/rules.d/device-mapper.rules
  # fix device-mapper link bug
  ln -sf /lib/libdevmapper.so $startdir/pkg/usr/lib/libdevmapper.so
}
