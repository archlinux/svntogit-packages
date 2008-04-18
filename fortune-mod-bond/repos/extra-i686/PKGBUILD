# $Id$
# Contributor: lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-bond
pkgver=1.0
pkgrel=1
pkgdesc="James Bond quotes fortune cookie files"
url="http://www.creative-sadness.de/?Linux:reisser"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://www.creative-sadness.de/files/james-bond.zip)
md5sums=('d73e0df5bd518df86509f50e6eba27c0')

build() {

    cd $startdir/src

    strfile ./james-bond ./james-bond.dat

    install -D -m644 $startdir/src/james-bond \
        $startdir/pkg/usr/share/fortune/james-bond

    install -D -m644 $startdir/src/james-bond.dat \
        $startdir/pkg/usr/share/fortune/james-bond.dat

}