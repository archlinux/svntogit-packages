# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=fortune-mod-futurama
pkgver=0.2
pkgrel=3
pkgdesc="Futurama fortune cookie files"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://www.netmeister.org/apps/$pkgname-$pkgver.tar.gz)
md5sums=('6fd2cfa2fd8285ff5aabb5e1236107bf')
url="http://www.netmeister.org/misc.html"

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p ../../pkg/usr/share/fortune
  cp futurama* ../../pkg/usr/share/fortune
  chmod 644 $startdir/pkg/usr/share/fortune/*
}
