# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10-ugly
pkgver=0.10.7
pkgrel=2
pkgdesc="GStreamer Multimedia Framework Ugly plugin libraries"
arch=(i686 x86_64)
license=('LGPL')
depends=('gstreamer0.10-base>=0.10.18-2')
makedepends=('pkgconfig')
url="http://gstreamer.freedesktop.org/"
_relname=gst-plugins-ugly
options=(!libtool)
source=(${url}/src/${_relname}/${_relname}-${pkgver}.tar.bz2)
md5sums=('cff4f55138d12152cf580a3ee71c2519')

build() {
  cd ${startdir}/src/${_relname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental --disable-external \
    --disable-docs-build --disable-plugin-docs \
    --with-package-name="GStreamer Ugly Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/" || return 1

  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
