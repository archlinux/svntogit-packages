# $Id$
# Contributor: lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-spblu
pkgver=0.2
pkgrel=1
pkgdesc="South Park: Bigger, Longer and Uncut movie fortune cookie files"
arch=('i686' 'x86_64')
url="http://eol.init1.nl/component/option,com_docman/Itemid,49/"
license=('GPL2')
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://eelco.is.a.rootboy.net/fortunecookies/SP-$pkgver.tar.gz)
md5sums=('1eed67e6ff7513d1f28369b66d551ada')

build() {

    cd $startdir/src/SP-$pkgver

    install -D -m644 $startdir/src/SP-$pkgver/SP \
        $startdir/pkg/usr/share/fortune/SP

    install -D -m644 $startdir/src/SP-$pkgver/SP.dat \
        $startdir/pkg/usr/share/fortune/SP.dat

}
