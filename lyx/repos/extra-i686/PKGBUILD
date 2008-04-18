# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
pkgname=lyx
pkgver=1.5.2
pkgrel=1
pkgdesc="An advanced open-source document processor."
arch=(i686 x86_64)
url='http://www.lyx.org'
depends=('qt' 'tetex' 'python' 'perl' 'imagemagick' 'aspell' 'aiksaurus')
license=('GPL2')
source=(ftp://ftp.lyx.org/pub/lyx/stable/$pkgname-$pkgver.tar.gz)
md5sums=('29c694fb042769bd3c886681bb922cfc')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr \
    --with-frontend=qt4
  make || return 1
  make prefix=$startdir/pkg/usr install
}
