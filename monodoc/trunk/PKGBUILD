# $Id$
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname=monodoc
pkgver=1.9
pkgrel=1
pkgdesc="The mono documentation browser and viewer"
license=('GPL')
arch=(i686 x86_64)
url="http://www.mono-project.com/"
depends=('mono>=1.9')
makedepends=('unzip')
options=(!makeflags)
source=(http://go-mono.com/sources/${pkgname}/${pkgname}-${pkgver}.zip)
md5sums=('f42e660cd18be30a5c903e044149f0b2')

build() {
  export MONO_SHARED_DIR="${startdir}/src/weird"
  mkdir -p "${MONO_SHARED_DIR}"

  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make \
    GACUTIL="/usr/bin/gacutil /root ${startdir}/pkg/usr/lib" \
    DESTDIR=${startdir}/pkg install

  install -Dm644 ${pkgname}.svg ${startdir}/pkg/usr/share/pixmaps/${pkgname}.svg
}
