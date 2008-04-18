# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>

pkgname=slang
pkgver=2.1.3
pkgrel=2
pkgdesc="S-Lang is a powerful interpreted language"
arch=(i686 x86_64)
depends=(glibc)
source=(ftp://ftp.fu-berlin.de/pub/unix/misc/slang/v2.1/slang-$pkgver.tar.gz)
md5sums=('da66de9579c4e2986b0285848f595c53')
license=(GPL)
url="http://www.s-lang.org/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make -j1 install-all DESTDIR=$startdir/pkg/
}
