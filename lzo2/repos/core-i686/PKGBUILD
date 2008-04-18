# $Id$
# Contributor: Low Kian Seong <fastmail_low@speedymail.org>
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=lzo2
pkgver=2.02
pkgrel=3
pkgdesc="a portable lossless data compression library written in ANSI C"
arch=(i686 x86_64)
url="http://www.oberhumer.com/opensource/lzo"
license=('GPL')
groups=('base')
depends=('glibc')
source=(http://www.oberhumer.com/opensource/lzo/download/lzo-${pkgver}.tar.gz)
options=(!libtool)
md5sums=('6760e5819f4238328709bf93bf10071c')

build() {
  cd ${startdir}/src/lzo-${pkgver}
  ./configure --prefix=/usr --enable-shared
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
