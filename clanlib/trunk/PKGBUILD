# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Orelien <aurelien.foret@wanadoo.fr>

pkgname=clanlib
pkgver=0.8.0
pkgrel=1
pkgdesc="A multi-platform game development library"
arch=("i686" "x86_64")
depends=('libxmu' 'libxi' 'mesa' 'libjpeg' 'libpng' 'libmikmod' 'libvorbis' 'sdl_gfx>=2.0.13')
#source=(http://www.clanlib.org/download/files/ClanLib-$pkgver-1.tar.gz)
source=("http://www.clanlib.org/download/releases-0.8/ClanLib-$pkgver.tgz")
url="http://www.clanlib.org/"

build() {
    cd $startdir/src/ClanLib-$pkgver
    ./configure --prefix=/usr \
                --disable-static \
                --enable-clanDisplay \
                --enable-clanGL \
                --enable-clanSound \
                --enable-clanNetwork \
                --enable-clanGUI  \
                --enable-clanMikMod \
                --enable-clanVorbis

    make || return 1
    make DESTDIR=$startdir/pkg install
    find $startdir/pkg -name '*.la' -exec rm {} \;
}
