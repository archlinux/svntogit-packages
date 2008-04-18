# $Id$
# Maintainer: Daniel Isenmann <daniel@archlinux.org>

pkgname=mono-basic
pkgver=1.9
pkgrel=1
pkgdesc="Mono Visual Basic.NET compiler"
arch=(i686 x86_64)
license=('GPL')
url="http://www.mono-project.com/"
depends=('mono>=1.9')
makedepends=('pkgconfig')
source=(http://www.go-mono.com/sources/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('45b298da5c1e3ff696c0319add5f7962')

build() {
  # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR=${startdir}/src/weird
  mkdir -p "${MONO_SHARED_DIR}"
  # build mono
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
