# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=mtr
pkgver=0.72
pkgrel=1
pkgdesc="Combines the functionality of traceroute and ping into one tool"
arch=(i686 x86_64)
license=('GPL')
depends=('gtk2' 'ncurses')
source=(ftp://ftp.bitwizard.nl/mtr/$pkgname-$pkgver.tar.gz)
url="http://www.bitwizard.nl/mtr/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-gtk2
  make || return 1
  make prefix=$startdir/pkg/usr install
}
md5sums=('d771061f8da96b80ecca2f69a3a2d594')
sha1sums=('afc26c9e8a30eba7ca92ba68d4489b0c9c07977d')
