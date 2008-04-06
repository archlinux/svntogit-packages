# $Id: PKGBUILD,v 1.9 2008/03/17 22:24:15 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10-ugly
pkgver=0.10.7
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Ugly Plugins (gst-plugins-ugly)"
arch=(i686 x86_64)
license=('LGPL')
depends=('gstreamer0.10-base>=0.10.17')
makedepends=('pkgconfig')
url="http://gstreamer.freedesktop.org/"
groups=('gstreamer0.10-plugins')
_relname=gst-plugins-ugly
source=(${url}/src/${_relname}/${_relname}-${pkgver}.tar.bz2
        uglyconf)
md5sums=('cff4f55138d12152cf580a3ee71c2519'
         '825050222a558d0cedeea3cfd2f716ea')

build() {
  cd ${startdir}/src/${_relname}-${pkgver}
  . ${startdir}/src/uglyconf
  rm -f ${startdir}/pkg/usr/lib/gstreamer-0.10/*.{,l}a
}
