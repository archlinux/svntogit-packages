# $Id$
# Maintainer: Mark Rosenstand <mark@archlinux.org>
pkgname=scrot
pkgver=0.8
pkgrel=2
pkgdesc="A simple command-line screenshot utility for X"
url="http://linuxbrit.co.uk/scrot/"
depends=('giblib')
source=(http://linuxbrit.co.uk/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('ccae904d225609571bdd3b03445c1e88')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
