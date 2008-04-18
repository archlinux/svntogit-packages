# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# AUR: skruw <skruw@home.se>
pkgname=terminatorx
pkgver=3.82
pkgrel=1
pkgdesc="Turntable emulator"
url="http://terminatorx.org"
license="GPL"
depends=(libxml2 gtk2 libcap alsa-lib liblrdf audiofile vorbis-tools mpg321 \
         libxext libx11 libxi libxxf86dga sox libmad jack-audio-connection-kit \
	 scrollkeeper)
source=(http://terminatorx.org/dist/terminatorX-$pkgver.tar.bz2)

build() {
  cd $startdir/src/terminatorX-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('72f17e3e34581e8090f4f53c1328f641')
