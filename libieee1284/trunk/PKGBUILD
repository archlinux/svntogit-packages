# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Committer: Manolis Tzanidakis <manolis@archlinux.org>

pkgname=libieee1284
pkgver=0.2.11
pkgrel=1
pkgdesc="A library to query devices connected in parallel port."
arch=(i686 x86_64)
url="http://cyberelk.net/tim/libieee1284"
depends=('glibc')
makedepends=('python')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('b8fff9f3d121531bc17430e3f4ea6ed0')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
}
