# $Id: PKGBUILD 153251 2012-03-12 14:53:13Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer
pkgver=1.0.1
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
sha256sums=('e0e5478bc81caa7e208b0863419bb98b2fbef281a7c806bea61bd70db8c9d3dc')

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
