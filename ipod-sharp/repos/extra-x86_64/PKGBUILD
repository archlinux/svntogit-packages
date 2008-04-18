# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=ipod-sharp
pkgver=0.6.3
pkgrel=1
pkgdesc="C# bindings for libipoddevice"
arch=(i686 x86_64)
license=('GPL')
url="http://banshee-project.org/Ipod-sharp"
depends=('libipoddevice>=0.5.3' 'mono>=1.2.3.1')
source=(http://banshee-project.org/files/ipod-sharp/${pkgname}-${pkgver}.tar.gz)
md5sums=('')

build() {
  export MONO_SHARED_DIR=${startdir}/src/.wabi
  mkdir -p "${MONO_SHARED_DIR}"

  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-docs --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install

  rm -fr "${MONO_SHARED_DIR}"
}
