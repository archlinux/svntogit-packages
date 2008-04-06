# $Id: PKGBUILD,v 1.9 2007/06/18 16:26:45 dan Exp $
# Maintainer: Simo Leone <simo@archlinux.org>
# Contributor: Simo Leone <neotuli@gmail.com>
pkgname=darcs
pkgver=1.0.9
pkgrel=1
pkgdesc="Decentralized replacement for CVS with roots in quantum mechanics"
arch=(i686 x86_64)
url="http://darcs.net/"
license=('GPL')
depends=('curl' 'gmp')
makedepends=('ghc')
install=darcs.install
source=("http://darcs.net/$pkgname-$pkgver.tar.gz")
md5sums=('07222cd3c500aa31e3332847573a4ab2')
sha1sums=('e085b73b0c82d7465f54709c91ef1d14147c63e5')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --with-sendmail=sendmail
  make || return 1
  make DESTDIR=$startdir/pkg install
}
