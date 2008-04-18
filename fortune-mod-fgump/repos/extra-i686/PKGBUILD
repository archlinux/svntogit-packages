# $Id$
# Contributor : Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: dale <dale@archlinux.org>

pkgname=fortune-mod-fgump
pkgver=0
pkgrel=2
pkgdesc="A collection --- fortune cookies --- of quotes from the film Forrest Gump."
depends=(fortune-mod)
source=(http://www.splitbrain.org/Fortunes/fgump/fortune-fgump.tgz)
md5sums=('d9d8e6ba103898e2fe6736378d352398')
url="http://www.splitbrain.org/index.php?x=.%2FFortunes%2Ffgump"

build() {
  cd $startdir/src/fortune-fgump
  mkdir -p $startdir/pkg/usr/share/fortune
  cp $startdir/src/fortune-fgump/fgump* $startdir/pkg/usr/share/fortune
  chmod 644 $startdir/pkg/usr/share/fortune/*
}
