# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=gimp-dbp
_srcname=dbp
_dlver=1-1-7
pkgver=$(echo ${_dlver} | sed 's/-/./g')
pkgrel=1
pkgdesc="David's batch processor for the GIMP"
arch=(i686 x86_64)
depends=('gimp>=2.4')
url="http://members.ozemail.com.au/~hodsond/dbp.html"
source=(http://www.ozemail.com.au/~hodsond/${_srcname}Src-${_dlver}.tgz)
md5sums=('0fef00adb228fd8297d309586c2aff83')

build() {
  cd ${startdir}/src/${_srcname}-${pkgver}
 # Tweak Makefile -- remove auto-install
  sed -i 's|^\tgimptool.*$||' Makefile
  sed -i '/DISABLE_DEPRECATED/d' Makefile
 # create gimp-2.0 plugin and install it
  make ${_srcname} || return 1
  install -Dsm755 ${_srcname} ${startdir}/pkg/usr/lib/gimp/2.0/plug-ins/${_srcname}
}
