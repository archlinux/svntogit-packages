# $Id$
# Contributor: lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-oneliners
pkgver=0.1
pkgrel=1
pkgdesc="Collection of oneliners fortune cookie files"
url="http://eol.init1.nl/component/option,com_docman/Itemid,49/"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://eol.init1.nl/dmdocuments/oneliners-0.1.tar.gz)
md5sums=('bf19c293d9bb446013a5438a97ba8031')

build() {

    cd $startdir/src/oneliners

    install -D -m644 $startdir/src/oneliners/oneliners \
        $startdir/pkg/usr/share/fortune/oneliners

    install -D -m644 $startdir/src/oneliners/oneliners.dat \
        $startdir/pkg/usr/share/fortune/oneliners.dat

}