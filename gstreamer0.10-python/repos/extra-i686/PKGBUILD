# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10-python
pkgver=0.10.9
pkgrel=1
pkgdesc="Python bindings for GStreamer 0.10"
arch=(i686 x86_64)
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('pygobject>=2.14.0' 'gstreamer0.10-base>=0.10.15')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://gstreamer.freedesktop.org/src/gst-python/gst-python-${pkgver}.tar.gz)
md5sums=('56d9e47306f3b0079086047eb85a71bc')

build() {
  cd ${startdir}/src/gst-python-${pkgver}
  ./configure --prefix=/usr --disable-docs
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
