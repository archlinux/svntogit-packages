# $Id: PKGBUILD,v 1.3 2007/09/12 20:29:39 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xdg-utils
pkgver=1.0.2
pkgrel=1
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks."
arch=(i686 x86_64)
url="http://portland.freedesktop.org/"
license=(MIT)
source=(http://portland.freedesktop.org/download/$pkgname-$pkgver.tgz)
md5sums=('348a5b91dc66426505022c74a64b2940')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
