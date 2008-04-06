# $Id: PKGBUILD,v 1.33 2008/03/15 09:43:43 thomas Exp $
# Maintainer: Thomas Baechler <thomas@archlinux.org>
pkgname=bluez-libs
pkgver=3.28
pkgrel=1
pkgdesc="Libraries for the Linux Bluetooth protocol stack"
arch=('i686' 'x86_64')
url="http://www.bluez.org/"
depends=('glibc')
license=('GPL')
options=(!libtool)
source=(http://bluez.sf.net/download/bluez-libs-${pkgver}.tar.gz)
md5sums=('3cb2072e11c81398710d8f565ac3c88f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
