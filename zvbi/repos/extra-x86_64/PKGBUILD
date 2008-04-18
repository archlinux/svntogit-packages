# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
pkgname=zvbi
pkgver=0.2.26
pkgrel=1
pkgdesc="zvbi is needed for zapping"
arch=(i686 x86_64)
depends=('libpng')
license=('GPL')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/zapping/$pkgname-$pkgver.tar.bz2)
url="http://zapping.sourceforge.net/cgi-bin/view/ZVBI/WebHome"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
md5sums=('82805319ca61f6ffd7b7bb64d7433448')
