# $Id$
# Maintainer: roberto <roberto@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=bladeenc
pkgver=0.94.2
pkgrel=1
pkgdesc="A freeware MP3 encoder"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glibc')
source=(http://bladeenc.mp3.no/source/$pkgname-$pkgver-src-stable.tar.gz)
url="http://bladeenc.mp3.no/"
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
