# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=nasm
pkgver=2.01
pkgrel=1
pkgdesc="80x86 assembler designed for portability and modularity"
url="http://nasm.sourceforge.net"
license=('LGPL')
arch=(i686 x86_64)
depends=('glibc')
source=(http://downloads.sourceforge.net/nasm/nasm-$pkgver.tar.bz2)
md5sums=('93384e87a452607c8d4ce533939295bd')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
