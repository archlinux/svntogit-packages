# $Id$
# Maintainer: damir <damir@archlinux.org>
# TU: Ben <ben@benmazer.net>

pkgname=xgalaga++
pkgver=0.7
pkgrel=3
pkgdesc="Enhanced version of xgalaga"
url="http://home.infomaniak.ch/mongenet/Marc/OSS/XGalaga/"
depends=('gcc' 'libxpm')
arch=('i686')
license=('GPL')
source=("http://home.infomaniak.ch/mongenet/Marc/OSS/XGalaga/debian/${pkgname}_${pkgver}.orig.tar.gz" \
        "$pkgname.png" \
        "$pkgname.desktop")

build() {
  cd $startdir/src/$pkgname-$pkgver
  # patch -p0 < $startdir/Makefile.patch
  make CXX=g++ all || return 1
  mkdir -p $startdir/pkg/usr/bin/
  cp xgalaga++ $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/man/man6/
  cp xgalaga++.6x $startdir/pkg/usr/man/man6

  # install some freedesktop.org compatibility
  install -D -m644 $startdir/src/$pkgname.desktop \
  $startdir/pkg/usr/share/applications/$pkgname.desktop
  install -D -m644 $startdir/src/$pkgname.png \
  $startdir/pkg/usr/share/pixmaps/$pkgname.png
}

md5sums=('3f79999966f4e46e89a8cae4fe4b6fba'
         'd9c3197830194479d2c2ba6268dd15d1'
         '1c774859064eee098d5a6b1ae159cf8d')
