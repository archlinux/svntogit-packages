# $Id: PKGBUILD,v 1.3 2003/11/06 08:27:17 dorphell Exp
# Maintainer: damir <damir@archlinux.org>
# Contributor: Paul Mattal <pjmattal@elys.com>

pkgname=hexedit
pkgver=1.2.12
pkgrel=1
pkgdesc="Hexedit Hex Editor for Linux"
arch=(i686 x86_64)
url="http://merd.net/pixel/hexedit.html"
depends=('glibc' 'ncurses')

source=(http://merd.net/pixel/$pkgname-$pkgver.src.tgz)

build() {
  cd $startdir/src/$pkgname
  ./configure
  make || return 1
  make prefix=$startdir/pkg/usr install || return 1
}


