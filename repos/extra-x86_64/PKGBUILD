# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libdv
pkgver=1.0.0
pkgrel=1
pkgdesc="The Quasar DV codec (libdv) is a software codec for DV video"
depends=('popt')
makedepends=('pkgconfig' 'gtk')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f895162161cfa4bb4a94c070a7caa6c7')
url="http://libdv.sourceforge.net/"
options=('NOLIBTOOL')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
