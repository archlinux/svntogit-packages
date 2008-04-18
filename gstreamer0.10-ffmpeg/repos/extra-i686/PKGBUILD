# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10-ffmpeg
pkgver=0.10.3
pkgrel=1
pkgdesc="Gstreamer FFMpeg Plugin"
arch=(i686 x86_64)
license=('GPL')
depends=('gstreamer0.10-base>=0.10.15')
makedepends=('pkgconfig')
url="http://www.gstreamer.net"
groups=('gstreamer0.10-plugins')
source=(http://gstreamer.freedesktop.org/src/gst-ffmpeg/gst-ffmpeg-${pkgver}.tar.bz2)
md5sums=('c07fd2da0835989fc4eae291cbc05f09')

build() {
  cd ${startdir}/src/gst-ffmpeg-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm -f ${startdir}/pkg/usr/lib/gstreamer-0.10/*.{l,}a
}
