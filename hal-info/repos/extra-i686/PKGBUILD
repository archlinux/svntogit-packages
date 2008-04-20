# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=hal-info
_date=20080317
pkgver=0.20080317
pkgrel=1
pkgdesc="Hardware Abstraction Layer information files"
arch=(i686 x86_64)
license=('GPL' 'custom')
url="http://www.freedesktop.org/wiki/Software/hal"
source=(http://hal.freedesktop.org/releases/hal-info-${_date}.tar.gz)
md5sums=('4cde7ff94f660879c44da17eb525edfd')

build() {
  cd ${startdir}/src/${pkgname}-${_date}
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/ || return 1
}
