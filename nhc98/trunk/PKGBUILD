# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=nhc98
pkgver=1.18
pkgrel=1
pkgdesc="nhc98 is a fully-fledged compiler for Haskell 98"
makedepends=('j2sdk')
install=nhc98.install
source=(ftp://ftp.cs.york.ac.uk/pub/haskell/nhc98/nhc98src-$pkgver.tar.gz ftp://ftp.cs.york.ac.uk/pub/haskell/nhc98/nhc98-$pkgver-library-interfaces.tar.gz ftp://ftp.cs.york.ac.uk/pub/haskell/nhc98/patch-1.18-newtype nhc98.install)
url="http://www.haskell.org/nhc98/"
md5sums=('f38b74481ec01a066cc9314b7bd18c90' 'f99f413a85462fe719ea634fd319d94f'\
         'b5e714c2065a622678fa8fe5fe970056' '8f910b0db29437ab7214d7b98160d372')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np0 -i ../patch-1.18-newtype
  ulimit -s unlimited
  ./configure --prefix=/usr --buildwith=gcc
  make || return 1
  make DESTDIR=$startdir/pkg install
}
