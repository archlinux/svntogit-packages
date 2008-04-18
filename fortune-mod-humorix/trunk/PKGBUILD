# $Id$
# Contributor: lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-humorix
pkgver=1.4
pkgrel=1
pkgdesc="Humorix fortune cookie files"
url="http://humorix.org"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://humorix.org/downloads/humorixfortunes-${pkgver}.tar.gz)
md5sums=('a0f5eb298aa5982aa54571f6e46aa58b')

build() {

    install -D -m644 $startdir/src/humorixfortunes-${pkgver}/humorix-misc \
        $startdir/pkg/usr/share/fortune/humorix-misc

    install -D -m644 $startdir/src/humorixfortunes-${pkgver}/humorix-misc.dat \
        $startdir/pkg/usr/share/fortune/humorix-misc.dat

    install -D -m644 $startdir/src/humorixfortunes-${pkgver}/humorix-stories \
        $startdir/pkg/usr/share/fortune/humorix-stories

    install -D -m644 $startdir/src/humorixfortunes-${pkgver}/humorix-stories.dat \
        $startdir/pkg/usr/share/fortune/humorix-stories.dat

}