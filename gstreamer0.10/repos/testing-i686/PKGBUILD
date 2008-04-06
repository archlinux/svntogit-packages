# $Id: PKGBUILD,v 1.16 2008/03/23 23:38:28 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10
pkgver=0.10.18
pkgrel=2
pkgdesc="GStreamer Multimedia Framework"
arch=(i686 x86_64)
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('libxml2' 'glib2>=2.16.1')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool')
source=(${url}/src/gstreamer/gstreamer-${pkgver}.tar.bz2
	gstfdsrc-revert.patch)
md5sums=('3b2f9b2b50f7265bbaac8ea10a8279b8' '02d4bd63167f36d14f1ad5fbc312289e')

build() {
  cd ${startdir}/src/gstreamer-${pkgver}
  patch -Np0 -R -i ${startdir}/src/gstfdsrc-revert.patch || return 1
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
