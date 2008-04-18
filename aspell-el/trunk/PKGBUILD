# $Id$
# Maintainer: Simo Leone <simo@archlinux.org>

pkgname=aspell-el
pkgver=0.50
pkgrel=3
pkgdesc="Greek dictionary for aspell."
depends=('aspell')
url="http://aspell.net/"
source=(ftp://ftp.gnu.org/gnu/aspell/dict/el/$pkgname-0.50-3.tar.bz2)
md5sums=('0ea2c42ceb9b91f7f5de2c017234ad37')

build() {
  cd $startdir/src/$pkgname-0.50-3
  ./configure
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install
}
# vim: ts=2 sw=2 et ft=sh
