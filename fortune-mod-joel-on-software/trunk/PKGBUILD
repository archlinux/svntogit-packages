# $Id$
# Contributor: lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-joel-on-software
pkgver=1.0
pkgrel=1
pkgdesc="Joel-on-software collection fortune cookie files"
url="http://vipe.technion.ac.il/~shlomif/humour/fortunes/"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://vipe.technion.ac.il/~shlomif/humour/fortunes/joel-on-software)
md5sums=('cbd0e4bca1a449a47b0e3d71fc39e432')

build() {

    cd $startdir/src

    strfile ./joel-on-software ./joel-on-software.dat

    install -D -m644 $startdir/src/joel-on-software \
        $startdir/pkg/usr/share/fortune/joel-on-software

    install -D -m644 $startdir/src/joel-on-software.dat \
        $startdir/pkg/usr/share/fortune/joel-on-software.dat

}