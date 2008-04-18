# $Id$
# Contributor: lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-friends
pkgver=1.0
pkgrel=1
pkgdesc="Friends series fortune cookie files"
url="http://vipe.technion.ac.il/~shlomif/humour/fortunes/"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://vipe.technion.ac.il/~shlomif/humour/fortunes/friends)
md5sums=('9f507d5b0fcdd700d077d5af1330b4f4')

build() {

    cd $startdir/src

    strfile ./friends ./friends.dat

    install -D -m644 $startdir/src/friends \
       $startdir/pkg/usr/share/fortune/friends

    install -D -m644 $startdir/src/friends.dat \
       $startdir/pkg/usr/share/fortune/friends.dat

}
