# $Id$
# Contributor: lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-matrix
pkgver=0.1.0
pkgrel=1
pkgdesc="Matrix fortune cookie files"
url="http://cx.capsi.com/code-matrixfortunes.html"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://cx.capsi.com/src/matrixfortunes/matrixfortunes-${pkgver}.tar.gz)
md5sums=('397698d61002c2982300d7bb88764be8')

build() {

    install -D -m644 $startdir/src/matrixfortunes-${pkgver}/matrix \
        $startdir/pkg/usr/share/fortune/matrix

    install -D -m644 $startdir/src/matrixfortunes-${pkgver}/matrix.dat \
        $startdir/pkg/usr/share/fortune/matrix.dat

}