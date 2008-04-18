# $Id$
# Contributor: Matthias-Christian Ott <matthias.christian.at.tiscali.de>
# Maintainer: Paul Mattal <paul@archlinux.org>

pkgname=diffstat
pkgver=1.45
pkgrel=1
pkgdesc="diffstat produces graph of changes introduced by a diff file"
arch=(i686 x86_64)
url="http://invisible-island.net/diffstat"
depends=(glibc)
license=("GPL")
source=(ftp://invisible-island.net/diffstat/diffstat-$pkgver.tgz)
md5sums=('cfe06ffcdbeaaa2fd296db867157ef78')

build () {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
