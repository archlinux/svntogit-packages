# $Id$
# Maintainer: Simo Leone <simo@archlinux.org>
# Contributor: Juan Pablo León <jp_leon@gmx.net>

pkgname=aspell-es
pkgver=0.50
pkgrel=4
pkgdesc="Spanish dictionary for aspell"
depends=('aspell')
url="http://aspell.net/"
source=(ftp://ftp.gnu.org/gnu/aspell/dict/es/$pkgname-$pkgver-2.tar.bz2)
md5sums=('4a8583e9ef9f4aed03f5a7fe09d40060')

build() {
  cd $startdir/src/$pkgname-$pkgver-2
  ./configure
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install
}
# vim: ts=2 sw=2 et ft=sh
