# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgname=fprint_demo
pkgver=0.4
pkgrel=1
pkgdesc="Simple GTK+ application to demonstrate and test libfprint's capabilities"
arch=('i686' 'x86_64')
url="http://reactivated.net/fprint/wiki/Main_Page"
license=('LGPL')
groups=('fprint')
depends=('libfprint')
source=(http://downloads.sourceforge.net/sourceforge/fprint/$pkgname-$pkgver.tar.bz2)
md5sums=('32e663a938e19801bdd17105d5c4d310')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
