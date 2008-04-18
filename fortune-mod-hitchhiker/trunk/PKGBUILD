# $Id$
# Contributor : Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: dale <dale@archlinux.org>

pkgname=fortune-mod-hitchhiker
pkgver=20050611
pkgrel=1
pkgdesc="This is a collection of quotes --- fortune cookies --- from Douglas Adams' famous Hitchhikers Guide to the Galaxy."
depends=(fortune-mod)
source=(http://www.splitbrain.org/Fortunes/hitchhiker/fortune-hitchhiker.tgz)
md5sums=('257df9a3f63db9f2e7c27369006812a3')
url="http://www.splitbrain.org/Fortunes/hitchhiker/index.php"

build() {
  cd $startdir/src/fortune-hitchhiker
  mkdir -p $startdir/pkg/usr/share/fortune
  cp $startdir/src/fortune-hitchhiker/hitchhiker* $startdir/pkg/usr/share/fortune
  chmod 644 $startdir/pkg/usr/share/fortune/*
}
