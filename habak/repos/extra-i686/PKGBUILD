# $Id$
# Maintainer: Simo Leone <simo@archlinux.org>
pkgname=habak
pkgver=0.2.5
pkgrel=2
pkgdesc="A background changing app"
url="http://fvwm-crystal.org"
license=""
depends=('imlib2' 'libx11')
source=(http://download.gna.org/fvwm-crystal/habak/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('bee5c394989367f7a4c5cb9ec99d307c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  install -m755 -D habak $startdir/pkg/usr/bin/habak
}
