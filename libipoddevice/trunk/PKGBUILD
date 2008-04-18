# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libipoddevice
pkgver=0.5.3
pkgrel=1
pkgdesc="Provides iPod-specific HAL event notification to applications"
arch=(i686 x86_64)
license=('LGPL')
url="http://banshee-project.org/Libipoddevice"
depends=('libgtop>=2.14.8' 'pmount>=0.9.3-2' 'sg3_utils')
makedepends=('pkgconfig')
options=('nolibtool')
source=(http://banshee-project.org/files/libipoddevice/${pkgname}-${pkgver}.tar.gz)
md5sums=('b72471b15253a1c779d4ca9991a17fd8')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install

  rm -f ${startdir}/pkg/usr/lib/libipoddevice.a
}
