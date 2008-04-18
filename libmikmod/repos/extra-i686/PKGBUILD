# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=libmikmod
pkgver=3.1.12
pkgrel=1
pkgdesc="A portable sound library"
license=('GPL' 'LGPL')
url="http://sourceforge.net/projects/mikmod/"
arch=('i686' 'x86_64')
depends=('glibc')
source=(http://downloads.sourceforge.net/mikmod/${pkgname}-${pkgver}.tar.gz)
md5sums=('9f3c740298260d5f88981fc0d51f6f16')
options=('!libtool')

build() {
  cd $startdir/src/$pkgname-$pkgver
  missing_dir="`pwd`" ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

