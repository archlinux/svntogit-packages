# $Id$
# Contributor: lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-subversion
pkgver=1.0
pkgrel=1
pkgdesc="Subversion fortune cookie files"
url="http://vipe.technion.ac.il/~shlomif/humour/fortunes/"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://vipe.technion.ac.il/~shlomif/humour/fortunes/subversion)
md5sums=('293e936dd88dd9c65291bd481ac962d5')

build() {

    cd $startdir/src

    strfile ./subversion ./subversion.dat

    install -D -m644 $startdir/src/subversion \
        $startdir/pkg/usr/share/fortune/subversion

    install -D -m644 $startdir/src/subversion.dat \
        $startdir/pkg/usr/share/fortune/subversion.dat

}