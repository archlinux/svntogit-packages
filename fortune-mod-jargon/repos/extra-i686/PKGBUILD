# $Id$
# Contributor: lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-jargon
pkgver=0.1.0
pkgrel=1
pkgdesc="Jargon fortune cookie files"
url="http://cx.capsi.com/code-jargonfortunes.html"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://cx.capsi.com/src/jargonfortunes/jargonfortunes-${pkgver}.tar.gz)
md5sums=('e4a8acea02310c81191312b7fe1a4e66')

build() {

    install -D -m644 $startdir/src/jargonfortunes-${pkgver}/jargon \
        $startdir/pkg/usr/share/fortune/jargon

    install -D -m644 $startdir/src/jargonfortunes-${pkgver}/jargon.dat \
        $startdir/pkg/usr/share/fortune/jargon.dat

}