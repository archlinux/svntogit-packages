# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libdc1394
pkgver=2.0.1
pkgrel=1
pkgdesc="High level programming interface to control IEEE 1394 based cameras"
arch=(i686 x86_64)
license=('LGPL')
depends=('libraw1394>=1.3.0')
options=(!libtool !emptydirs)
source=(http://downloads.sourceforge.net/sourceforge/libdc1394/${pkgname}-${pkgver}.tar.gz)
url="http://sourceforge.net/projects/libdc1394/"
md5sums=('6b5abeed347e7f6682f4fa9f06437a5f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
