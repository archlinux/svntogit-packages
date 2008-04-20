# $Id$
# Maintainer: Simo Leone <simo@archlinux.org>
# Contributor: Simo Leone <neotuli@gmail.com>
pkgname=darcs
pkgver=2.0.0
pkgrel=1
pkgdesc="Decentralized replacement for CVS with roots in quantum mechanics"
arch=(i686 x86_64)
url="http://darcs.net/"
license=('GPL')
depends=('curl' 'gmp')
makedepends=('ghc')
install=darcs.install
source=("http://darcs.net/$pkgname-$pkgver.tar.gz")
md5sums=('89e48c2fb388692b78b3cceeb86a95a7')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --with-sendmail=sendmail
  make || return 1
  make DESTDIR=$startdir/pkg install
}
