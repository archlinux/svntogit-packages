# $Id$
# Maintainer: Paul Mattal <paul@archlinux.org>
pkgname=ddrescue
pkgver=1.7
pkgrel=1
pkgdesc="Data recovery version of the Linux DD device copying utility"
arch=(i686 x86_64)
url="http://www.gnu.org/software/ddrescue/ddrescue.html"
license=('GPL')
depends=('gcc-libs')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://savannah.gnu.org/download/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('e4c226892f2f2e01c58197c9435cd611')

build() {
  cd $startdir/src/$pkgname-$pkgver || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  # once info pages are removed, /usr/share will be empty but we ignore that
}
