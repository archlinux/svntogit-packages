# $Id$
# Maintainer: damir <damir@archlinux.org>
pkgname=corewars
pkgver=0.9.13
pkgrel=1
pkgdesc="Corewars is a simulation game where a number of programs try to crash each other"
url="http://corewars.sourceforge.net/"
depends=('gtk')
source=(http://belnet.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
