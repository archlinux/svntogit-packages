# $Id$
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=gecko-sharp-2.0
pkgver=0.13
pkgrel=1
pkgdesc="C# bindings for gtkmozembed"
arch=(i686 x86_64)
url="http://www.mono-project.com/"
depends=('xulrunner>=1.8.1.11' 'gtk-sharp-2>=2.12.0')
makedepends=('monodoc' 'pkgconfig')
source=(http://go-mono.com/sources/gecko-sharp-2.0/gecko-sharp-2.0-${pkgver}.tar.bz2)
md5sums=('f88eaa06e71f8d8fa34cf59a3e034a6b')

build() {
  [ -z "${MOZ_PLUGIN_PATH}" ] && . /etc/profile.d/mozilla-common.sh
  
  # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR=${startdir}/src/weird
  mkdir -p ${MONO_SHARED_DIR}

  # build
  cd ${startdir}/src/gecko-sharp-2.0-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make GACUTIL="/usr/bin/gacutil /root ${startdir}/pkg/usr/lib" \
    DESTDIR=${startdir}/pkg install
  
    # housecleaning
  rm -rf ${MONO_SHARED_DIR}
}
