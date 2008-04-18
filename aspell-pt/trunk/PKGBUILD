# $Id$
# Maintainer: Simo Leone <simo@archlinux.org>
# Contributor: jlvsimoes <jlvsimoes@oninet.pt>

pkgname=aspell-pt
pkgver=0.50
pkgrel=3
pkgdesc="Portuguese dictionary for aspell"
depends=('aspell')
url="http://aspell.net/"
source=(ftp://ftp.gnu.org/gnu/aspell/dict/pt/$pkgname-$pkgver-2.tar.bz2)
md5sums=('e4e15179f90b76ec0336b687d1293edd')

build() {
  cd $startdir/src/$pkgname-$pkgver-2
  ./configure
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install
}
# vim: ts=2 sw=2 et ft=sh
