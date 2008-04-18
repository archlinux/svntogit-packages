# $Id$
# Maintainer: simo <simo@archlinux.org>
pkgname=libticables
pkgver=1.2.0
pkgrel=1
pkgdesc="TI Link Cable Library"
arch=(i686 x86_64)
url="http://tilp.info/"
license="GPL"
depends=('libusb' 'glib2')
options=('FORCE' 'NOLIBTOOL')
source=(http://www.archlinux.org/~simo/tilp/tilibs2/libticables2-$pkgver.tar.gz)
md5sums=('d25f4e30a14c414278e7ab59b2c5d6bd')

build() {
  cd $startdir/src/libticables2-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
