# $Id: PKGBUILD,v 1.8 2008/03/17 18:38:18 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10-good
pkgver=0.10.7
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Good Plugins (gst-plugins-good)"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gstreamer0.10-base>=0.10.17' 'libxdamage')
makedepends=('perlxml' 'pkgconfig')
url="http://gstreamer.freedesktop.org/"
groups=('gstreamer0.10-plugins')
_relname=gst-plugins-good
source=(${url}/src/${_relname}/${_relname}-${pkgver}.tar.bz2
        goodconf)
md5sums=('e02d729b22451f75414a27456ae5c16a'
	 '286997a71b363bc31ca4d231282bc01f')
build() {
  cd ${startdir}/src/${_relname}-${pkgver}
  gst_conf="--disable-gconftool --enable-experimental --disable-static"
  . ${startdir}/src/goodconf
  rm -f ${startdir}/pkg/usr/lib/gstreamer-0.10/*.{,l}a
}
