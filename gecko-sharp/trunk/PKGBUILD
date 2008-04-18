# $Id$
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=gecko-sharp
pkgver=0.6
pkgrel=9
force="y"
pkgdesc="a C# binding to gtkmozembedded"
arch=(i686 x86_64)
url=""
depends=('xulrunner>=1.8.1.12' 'gtk-sharp>=1.0.10-6')
makedepends=('pkgconfig')
source=(http://go-mono.com/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('9ce9bb08125f7c7eecf8bd696a3345bd')

build() {
  # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR=${startdir}/src/weird
  mkdir -p ${MONO_SHARED_DIR}
  
  # import pathes
  [ -z "${MOZ_PLUGIN_PATH}" ] && . /etc/profile.d/mozilla-common.sh
  export MOZILLA_FIVE_HOME=/usr/lib/xulrunner
  
  # build
  cd ${startdir}/src/gecko-sharp-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make GACUTIL="/usr/bin/gacutil /root ${startdir}/pkg/usr/lib" \
    DESTDIR=${startdir}/pkg install
  
  # housecleaning
  rm -rf ${MONO_SHARED_DIR}
}
# vim: ft=sh ts=2
