# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=dirmngr
pkgver=0.9.7
pkgrel=1
pkgdesc="DirMngr is a daemon to handle CRL and certificate requests"
arch=(i686 x86_64)
license=('GPL')
url="ftp://ftp.gnupg.org/gcrypt/dirmngr"
depends=('libgcrypt' 'libldap' 'libksba' 'libgpg-error' 'libassuan' 'pth')
source=(ftp://ftp.gnupg.org/gcrypt/alpha/$pkgname/$pkgname-$pkgver.tar.bz2)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr  --libexecdir=/usr/lib
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('79710c33372ed21100f984d456703b47')
