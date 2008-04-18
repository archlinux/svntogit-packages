# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
pkgname=hping
pkgver=2.0.0
pkgextra=rc3
pkgrel=2
pkgdesc="hping is a command-line oriented TCP/IP packet assembler/analyzer."
url="http://www.hping.org"
depends=('glibc')
source=(http://www.hping.org/$pkgname$pkgver-$pkgextra.tar.gz Makefile.patch)
md5sums=('029bf240f2e0545b664b2f8b9118d9e8' '1b96ae1b7f8573f2b8fad41a5dae2503')

build() {
  cd $startdir/src/hping2-$pkgextra
  ./configure
  patch -p0 < ../Makefile.patch
  make || return 1
  mkdir -p $startdir/pkg/usr/sbin
  mkdir -p $startdir/pkg/usr/man/man8
  make prefix=$startdir/pkg/usr install
}
