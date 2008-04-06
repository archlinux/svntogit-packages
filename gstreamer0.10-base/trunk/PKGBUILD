# $Id: PKGBUILD,v 1.16 2008/03/21 22:36:44 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10-base
pkgver=0.10.18
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Base Plugins (gst-plugins-base)"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('gstreamer0.10>=0.10.18' 'liboil>=0.3.14' 'libsm' 'libxv')
makedepends=('pkgconfig')
url="http://gstreamer.freedesktop.org/"
groups=('gstreamer0.10-plugins')
_relname=gst-plugins-base
source=(${url}/src/${_relname}/${_relname}-${pkgver}.tar.bz2
        baseconf)
md5sums=('422e654b049dedef6fdbf4456f2259d1'
         '7891f4366e5fe513550ac17b67ca7d0a')

build() {
  cd ${startdir}/src/${_relname}-${pkgver}
  gst_conf="--enable-experimental"
  . ${startdir}/src/baseconf
  rm -f ${startdir}/pkg/usr/lib/gstreamer-0.10/*.{,l}a
}
