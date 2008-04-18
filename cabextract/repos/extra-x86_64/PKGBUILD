# $Id$
# Maintainer: dale <dale@archlinux.org>
pkgname=cabextract
pkgver=1.2
pkgrel=1
pkgdesc="A program to extract Microsoft cabinet (.CAB) files."
license=(GPL)
arch=(i686 x86_64)
depends=(glibc)
conflicts=()
backup=()
install=
url="http://www.kyz.uklinux.net/cabextract.php"
source=(http://www.kyz.uklinux.net/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('dc421a690648b503265c82ade84e143e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make prefix=$startdir/pkg/usr install
}
