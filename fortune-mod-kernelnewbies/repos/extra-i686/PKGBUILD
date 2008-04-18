# $Id$
# Contributor: lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-kernelnewbies
pkgver=20060120
pkgrel=1
pkgdesc="Kernelnewbies.org IRC fortune cookie files"
arch=(i686 x86_64)
url="http://kernelnewbies.org"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://old.kernelnewbies.org/kernelnewbies-fortunes.tar.gz)

build() {

    cd $startdir/src

    install -D -m644 $startdir/src/kernelnewbies \
        $startdir/pkg/usr/share/fortune/kernelnewbies

    install -D -m644 $startdir/src/kernelnewbies.dat \
        $startdir/pkg/usr/share/fortune/kernelnewbies.dat

}
