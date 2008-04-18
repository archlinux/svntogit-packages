# $Id$
# Contributor : lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-romeojuliet
pkgver=1.0
pkgrel=1
pkgdesc="Romeo and Juliet fortune cookie files (rj)"
url="http://www.geocities.com/kensanata/wiki/FortuneCookies.html"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://www.geocities.com/kensanata/rj.tar.gz)
md5sums=('365f928cd7ef58be865975ae6274ca57')

build() {

    cd $startdir/src

    install -D -m644 $startdir/src/rj \
        $startdir/pkg/usr/share/fortune/rj

    install -D -m644 $startdir/src/rj.dat \
        $startdir/pkg/usr/share/fortune/rj.dat
}
