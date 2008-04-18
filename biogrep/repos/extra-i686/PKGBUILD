# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=biogrep
pkgver=1.0
pkgrel=1
pkgdesc="match large sets of patterns against biosequence databases"
arch=(i686 x86_64)
license=('GPL')
url="http://web.mit.edu/bamel/biogrep.shtml"
depends=('glibc')
source=(http://web.mit.edu/bamel/biogrep-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
md5sums=('90fb4987301b4c84f16e36e82c679e16')
