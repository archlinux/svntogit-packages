# $Id: PKGBUILD,v 1.33 2008/03/15 09:43:43 thomas Exp $
# Maintainer: Thomas Baechler <thomas@archlinux.org>
pkgname=bluez-libs
pkgver=3.30
pkgrel=1
pkgdesc="Libraries for the Linux Bluetooth protocol stack"
arch=('i686' 'x86_64')
url="http://www.bluez.org/"
depends=('glibc')
license=('GPL')
options=(!libtool)
source=(http://bluez.sf.net/download/bluez-libs-${pkgver}.tar.gz)
md5sums=('60d48b5b83d98718ea642a887fa59b0b')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
