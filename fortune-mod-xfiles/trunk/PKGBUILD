# $Id$
# Contributor : Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: dale <dale@archlinux.org>

pkgname=fortune-mod-xfiles
pkgver=0
pkgrel=2
pkgdesc="A collection --- fortune cookies --- from X-Files. "
depends=(fortune-mod)
source=(http://www.splitbrain.org/Fortunes/xfiles/fortune-xfiles.tgz)
md5sums=('dfbe17a0b0b78e5914d0838852becb7b')
url="http://www.splitbrain.org/index.php?x=.%2FFortunes%2Fxfiles"

build() {
  cd $startdir/src/xfiles
  mkdir -p $startdir/pkg/usr/share/fortune
  cp $startdir/src/fortune-xfiles/xfiles* $startdir/pkg/usr/share/fortune
  chmod 644 $startdir/pkg/usr/share/fortune/*
}
