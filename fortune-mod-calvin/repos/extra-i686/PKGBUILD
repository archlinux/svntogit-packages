# $Id$
# Contributor : Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: dale <dale@archlinux.org>

pkgname=fortune-mod-calvin
pkgver=0.1.1
pkgrel=2
pkgdesc="Calvin and Hobbes fortune cookie"
depends=(fortune-mod)
source=(http://www.netmeister.org/apps/$pkgname-$pkgver.tar.gz)
md5sums=('e0dc2036b731aafdee4989e9d1d8ec2a')
url="http://www.netmeister.org/misc.html"

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/share/fortune
  cp $startdir/src/$pkgname-$pkgver/calvin* $startdir/pkg/usr/share/fortune
  chmod 644 $startdir/pkg/usr/share/fortune/*
}

