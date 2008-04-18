# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10-base
pkgver=0.10.19
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Base plugin libraries"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('gstreamer0.10>=0.10.19' 'liboil>=0.3.14' 'libsm' 'libxv')
makedepends=('pkgconfig')
options=(!libtool)
url="http://gstreamer.freedesktop.org/"
_relname=gst-plugins-base
source=(${url}/src/${_relname}/${_relname}-${pkgver}.tar.bz2)
md5sums=('9c9614cbb6497b7fee1c954b9d5ae3b7')

build() {
  cd ${startdir}/src/${_relname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental --disable-external \
    --disable-docs-build --disable-plugin-docs \
    --with-package-name="GStreamer Base Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/" || return 1

  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
