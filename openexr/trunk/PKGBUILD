# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openexr
pkgver=1.4.0a
pkgrel=2
depends=('mesa' 'libxext' 'libxft' 'fltk')
makedepends=('xproto')
pkgdesc="openexr library for EXR images"
arch=(i686 x86_64)
options=(NOLIBTOOL)
source=(http://savannah.nongnu.org/download/$pkgname/$pkgname-$pkgver.tar.gz)
url="http://www.openexr.org"

build() {
  cd $startdir/src/$pkgname-1.4.0
   # gcc4 fix
  #patch -Np1 -i ../openexr-gcc4.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('d0a4b9a930c766fa51561b05fb204afe')
