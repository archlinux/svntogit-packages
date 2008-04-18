# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gnet
pkgver=2.0.7
pkgrel=3
pkgdesc="GNet is a simple network library"
arch=('i686' 'x86_64')
url="http://www.gnetlibrary.org/"
license=('LGPL')
depends=('glib2')
options=('!libtool')
source=(http://www.gnetlibrary.org/src/$pkgname-$pkgver.tar.gz)
md5sums=('3a7a40411775688fe4c42141ab007048')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
