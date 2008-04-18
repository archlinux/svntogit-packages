# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10
pkgver=0.10.19
pkgrel=1
pkgdesc="GStreamer Multimedia Framework"
arch=(i686 x86_64)
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('libxml2' 'glib2>=2.16.2')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool')
source=(${url}/src/gstreamer/gstreamer-${pkgver}.tar.bz2)
md5sums=('12072a3168420350ea450749a3b63be8')

build() {
  cd ${startdir}/src/gstreamer-${pkgver}
  ./configure --prefix=/usr \
	--sysconfdir=/etc --localstatedir=/var \
	--disable-docs-build || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  cd ${startdir}/pkg/usr/bin

  #Remove unversioned gst-* binaries to get rid of conflicts
  for bins in `ls *-0.10`; do
    rm -f ${bins/-0.10/}
  done
}
