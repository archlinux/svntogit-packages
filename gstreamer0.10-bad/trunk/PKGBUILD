# $Id: PKGBUILD,v 1.9 2008/03/17 22:42:11 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10-bad
pkgver=0.10.6
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Bad Plugins (gst-plugins-bad)"
arch=(i686 x86_64)
license=('LGPL' 'GPL')
depends=('gcc-libs>=4.3.0' 'gstreamer0.10-base>=0.10.17')
makedepends=('pkgconfig')
url="http://gstreamer.freedesktop.org/"
groups=('gstreamer0.10-plugins')
_relname=gst-plugins-bad
source=(${url}/src/${_relname}/${_relname}-${pkgver}.tar.bz2
        badconf)
md5sums=('fb47838aa0ccef52683cea5d89364053'
         '247d6fde78f24551e2e1406e616b108d')

build() {
  cd ${startdir}/src/${_relname}-${pkgver}
  . ${startdir}/src/badconf
  rm -f ${startdir}/pkg/usr/lib/gstreamer-0.10/*.{,l}a
}
