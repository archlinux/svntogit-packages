# $Id$
# Contributor : lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-osho
pkgver=1.1
pkgrel=1
pkgdesc="Spiritual guru Osho quotes fortune cookie files"
url="http://www.geocities.com/avitiw/fortune.html"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://www.geocities.com/avitiw/fortune-osho-1.1.tar.gz)
md5sums=('eccf30cb3609adaa01a1d7eaee24dae1')

build() {

    cd $startdir/src

    install -D -m644 $startdir/src/osho \
        $startdir/pkg/usr/share/fortune/osho

    install -D -m644 $startdir/src/osho.dat \
        $startdir/pkg/usr/share/fortune/osho.dat

}