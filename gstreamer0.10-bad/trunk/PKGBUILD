# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10-bad
pkgver=0.10.6
pkgrel=2
pkgdesc="GStreamer Multimedia Framework Bad Plugin libraries (gst-plugins-bad)"
arch=(i686 x86_64)
license=('LGPL' 'GPL')
depends=('gcc-libs>=4.3.0' 'gstreamer0.10-base>=0.10.18-2')
makedepends=('pkgconfig')
url="http://gstreamer.freedesktop.org/"
options=(!libtool)
_relname=gst-plugins-bad
source=(${url}/src/${_relname}/${_relname}-${pkgver}.tar.bz2
	configure-external.patch)
md5sums=('fb47838aa0ccef52683cea5d89364053' '5a18e22749fec5b6f32a382e9b58d1da')

build() {
  cd ${startdir}/src/${_relname}-${pkgver}
  patch -Np0 -i ${startdir}/src/configure-external.patch || return 1
  autoconf || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental --disable-external \
    --disable-docs-build --disable-plugin-docs \
    --with-package-name="GStreamer Bad Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/" || return 1

  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
