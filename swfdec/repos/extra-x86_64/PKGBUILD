#$Id: PKGBUILD,v 1.12 2007/12/30 13:55:30 andyrtr Exp $
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=swfdec
pkgver=0.5.5
pkgrel=1
pkgdesc="free library for decoding and rendering Flash animations"
arch=('i686' 'x86_64')
url="http://swfdec.freedesktop.org"
license=('LGPL')
depends=('gstreamer0.10' 'gstreamer0.10-ffmpeg' 'alsa-lib' 'liboil' 'libmad' 'gtk2' 'libsoup')
makedepends=('pkgconfig')
source=(http://swfdec.freedesktop.org/download/swfdec/0.5/${pkgname}-${pkgver}.tar.gz)
options=('!libtool' '!emptydirs')
md5sums=('b988b014e210cee205aeccaca4d6a9a7')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-static --enable-gtk \
	--enable-mad --disable-gnome-vfs --enable-soup --with-audio=alsa
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
