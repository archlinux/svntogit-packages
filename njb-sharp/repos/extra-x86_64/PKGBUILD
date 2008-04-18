# $Id$
# Maintainer: Mark Rosenstand <mark@archlinux.org>
pkgname=njb-sharp
pkgver=0.3.0
pkgrel=1
pkgdesc="C# bindings for libnjb"
arch=(i686 x86_64)
url="http://banshee-project.org/Njb-sharp"
license=(GPL)
depends=('libnjb>=2.2.5' 'mono>=1.1.17.1')
makedepends=('pkgconfig')
options=('nolibtool')
source=(http://banshee-project.org/files/njb-sharp/${pkgname}-${pkgver}.tar.gz)
md5sums=('d59525dcfa69d6196b339b519f53525e')

build() {
  export MONO_SHARED_DIR=${startdir}/src/.wabi
  mkdir -p "${MONO_SHARED_DIR}"

  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-docs
  make || return 1
  make DESTDIR=${startdir}/pkg install

  rm -fr "${MONO_SHARED_DIR}"
}
