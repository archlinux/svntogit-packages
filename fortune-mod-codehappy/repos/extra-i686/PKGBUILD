# $Id$
# Contributor : lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-codehappy
pkgver=20041003
pkgrel=1
pkgdesc="Chris Street's collection of 30K+ fortune cookies"
url="http://www.codehappy.net/fortune.shtml"
makedepends=('hd2u')
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://www.codehappy.net/fortune/fortune.zip)
md5sums=('56dc2a4375746cb722feab2d9683620d')

build() {

    cd $startdir/src/

    dos2unix -U $startdir/src/FORTUNE
    mv $startdir/src/FORTUNE $startdir/src/codehappy

    strfile ./codehappy ./codehappy.dat

    install -D -m644 $startdir/src/codehappy \
        $startdir/pkg/usr/share/fortune/codehappy

    install -D -m644 $startdir/src/codehappy.dat \
        $startdir/pkg/usr/share/fortune/codehappy.dat

}