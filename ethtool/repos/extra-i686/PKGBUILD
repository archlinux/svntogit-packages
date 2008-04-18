# $Id$
# Maintainer: Paul Mattal <paul@archlinux.org>
# Contributer: Martin Kemp <mdkemp@elys.com>
pkgname=ethtool
pkgver=6
pkgrel=1
pkgdesc="gkernel ethtool"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/gkernel/"
license=('GPL')
depends=(glibc)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://easynews.dl.sf.net/sourceforge/gkernel/$pkgname-$pkgver.tar.gz)
md5sums=('3b721ec27f17ebf320ba8c505cf66d9c')

build() {
  cd $startdir/src/$pkgname-$pkgver || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
