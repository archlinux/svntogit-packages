#$Id: PKGBUILD,v 1.13 2008/03/17 20:08:08 andyrtr Exp $
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=swfdec
pkgver=0.6.4
pkgrel=1
pkgdesc="free library for decoding and rendering Flash animations"
arch=('i686' 'x86_64')
url="http://swfdec.freedesktop.org"
license=('LGPL')
depends=('gstreamer0.10-base>=0.10.19' 'ffmpeg>=20071204-1' 'alsa-lib>=1.0.16' 'liboil>=0.3.14'
	 'libmad>=0.15.1b-2' 'gtk2>=2.12.9' 'libsoup>=2.4.0')
makedepends=('pkgconfig')
source=(http://swfdec.freedesktop.org/download/swfdec/0.6/${pkgname}-${pkgver}.tar.gz)
options=('!libtool' '!emptydirs')
md5sums=('a1568696246889109b884cb5434e81fc')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-static --enable-gtk \
	--enable-mad --enable-ffmpeg --disable-gnome-vfs \
	--enable-gstreamer --enable-soup --with-audio=alsa
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
