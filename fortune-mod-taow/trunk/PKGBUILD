# $Id$
# Contributor : Kevin Piche <kevin@archlinux.org>
# Maintainer : Kevin Piche <kevin@archlinux.org>

pkgname=fortune-mod-taow
pkgver=1.0
pkgrel=2
pkgdesc="Sun Tzu's The Art of War fortune cookie files."
url="http://www.de-brauwer.be/wiki/wikka.php?wakka=TheArtOfWar"
depends=(fortune-mod)
groups=('fortune-mods')
source=(http://www.de-brauwer.be/wastebasket/fortunes-taow-$pkgver.tar.gz)
md5sums=('c06afa91c495e61b31bf5602d4230611')

build() {
  cd $startdir/src/fortunes-taow-$pkgver
  mkdir -p $startdir/pkg/usr/share/fortune
  cp $startdir/src/fortunes-taow-$pkgver/taow* $startdir/pkg/usr/share/fortune
  chmod 644 $startdir/pkg/usr/share/fortune/*
}
