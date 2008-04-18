# $Id$
# Contributor : Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: dale <dale@archlinux.org>

pkgname=fortune-mod-tao
pkgver=0
pkgrel=2
pkgdesc="Tao Te King fortune cookies"
depends=(fortune-mod)
source=(http://ftp.fredan.se/pub/gentoo.org/distfiles/fortune-tao.tar.gz)
md5sums=('9dd679fee3a8fff17daaf6563fd2cd8f')

build() {
  cd $startdir/src/fortune-tao
  mkdir -p $startdir/pkg/usr/share/fortune
  cp $startdir/src/fortune-tao/tao* $startdir/pkg/usr/share/fortune
  chmod 644 $startdir/pkg/usr/share/fortune/*
}
