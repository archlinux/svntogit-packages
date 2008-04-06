# $Id: PKGBUILD,v 1.6 2007/05/31 11:48:46 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=iso-codes
pkgver=1.1
pkgrel=1
arch=(i686 x86_64)
license=('LGPL')
pkgdesc="Lists of the country, language, and currency names"
source=(ftp://pkg-isocodes.alioth.debian.org/pub/pkg-isocodes/${pkgname}-${pkgver}.tar.bz2)
url="http://pkg-isocodes.alioth.debian.org/"

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg pkgconfigdir=/usr/lib/pkgconfig install
}
