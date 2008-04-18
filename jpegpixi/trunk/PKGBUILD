# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=jpegpixi
pkgver=1.1.1
pkgrel=1
arch=('i686')
license=('gpl')
pkgdesc="JPEG Pixel Interpolator"
url="http://www.zero-based.org/software/jpegpixi/"
depends=('libjpeg')
source=($url/${pkgname}-${pkgver}.tar.gz)


build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}


md5sums=('c888abdb58ff63d634215d4d5b160d5d')
