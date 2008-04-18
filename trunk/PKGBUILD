# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=gtkglext
pkgver=1.2.0
pkgrel=1
pkgdesc="opengl extensions for gtk2"
url="http://gtkglext.sourceforge.net/"
depends=('gtk2' 'pango')
makedepends=('gcc>=4.0.3')
source=("http://puzzle.dl.sourceforge.net/sourceforge/gtkglext/$pkgname-$pkgver.tar.bz2") # $pkgname-$pkgver-pangox.patch)

build() {
  cd $startdir/src/$pkgname-$pkgver
  # fix "undefined reference to `pango_x_font*" trouble
  #cat $startdir/src/$pkgname-$pkgver-pangox.patch | patch -p1 || return 1
  autoconf --force
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
