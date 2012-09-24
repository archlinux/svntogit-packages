# $Id: PKGBUILD 153251 2012-03-12 14:53:13Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer
pkgver=1.0.0
pkgrel=1
pkgdesc="GStreamer Multimedia Framework"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('libxml2' 'glib2')
optdepends=('sh: feedback script')
makedepends=('intltool' 'pkgconfig' 'gtk-doc' 'gobject-introspection')
options=('!libtool')
source=(${url}/src/gstreamer/gstreamer-${pkgver}.tar.xz)
sha256sums=('d0f9887ff1c81a33220add2e6d3eb84d869c485c83523a8da0ce1f0cb2463f58')

build() {
  cd "${srcdir}/gstreamer-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib \
    --with-package-name="GStreamer (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/" \
    --enable-gtk-doc --disable-static
  make
}

check() {
  cd "${srcdir}/gstreamer-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/gstreamer-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
