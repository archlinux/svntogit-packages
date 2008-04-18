# $Id$
# Contributor: lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-shlomif
pkgver=1.0
pkgrel=1
pkgdesc="Shlomif collection fortune cookie files"
url="http://vipe.technion.ac.il/~shlomif/humour/fortunes/"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://vipe.technion.ac.il/~shlomif/humour/fortunes/shlomif)
md5sums=('1218b743b8966794d7ae3edab1e64029')

build() {

    cd $startdir/src

    strfile ./shlomif ./shlomif.dat

    install -D -m644 $startdir/src/shlomif \
        $startdir/pkg/usr/share/fortune/shlomif

    install -D -m644 $startdir/src/shlomif.dat \
        $startdir/pkg/usr/share/fortune/shlomif.dat

}