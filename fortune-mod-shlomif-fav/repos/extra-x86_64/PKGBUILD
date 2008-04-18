# $Id$
# Contributor: lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-shlomif-fav
pkgver=1.0
pkgrel=1
pkgdesc="Shlomif favourites fortune cookie files"
url="http://vipe.technion.ac.il/~shlomif/humour/fortunes/"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://vipe.technion.ac.il/~shlomif/humour/fortunes/shlomif-fav)
md5sums=('c9780c5ae1c6076eb0cb0b7e028da47b')

build() {

    cd $startdir/src

    strfile ./shlomif-fav ./shlomif-fav.dat

    install -D -m644 $startdir/src/shlomif-fav \
        $startdir/pkg/usr/share/fortune/shlomif-fav

    install -D -m644 $startdir/src/shlomif-fav.dat \
        $startdir/pkg/usr/share/fortune/shlomif-fav.dat

}