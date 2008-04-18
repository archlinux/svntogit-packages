# $Id$
# Contributor : Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: damir <damir@archlinux.org>

pkgname=potracegui
pkgver=1.3.4
pkgrel=1
pkgdesc="Frontend for potrace"
url="http://potracegui.sourceforge.net/"
depends=('potrace' 'kdelibs>=3.5')
makedepends=('autotrace')

source=(http://puzzle.dl.sourceforge.net/sourceforge/potracegui/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make prefix=$startdir/pkg/opt/kde install
}


