# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=ogmtools
pkgver=1.5
pkgrel=1
pkgdesc="Tools that allow information about, extraction from or creation of OGG media streams (OGM)"
url="http://www.bunkus.org/videotools/ogmtools"
depends=('libvorbis' 'libdvdread' 'gcc')
source=($url/$pkgname-$pkgver.tar.bz2)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
