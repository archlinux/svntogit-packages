# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: André Klitzing <aklitzing@online.de>
pkgname=exempi
pkgver=1.99.9
pkgrel=2
pkgdesc="A library to parse XMP metadata"
arch=(i686 x86_64)
url="http://libopenraw.freedesktop.org/wiki/Exempi"
license=('custom:BSD')
depends=('gcc-libs>=4.3.0' 'expat>=2.0.1')
makedepends=('boost>=1.34.1')
options=(!libtool)
source=(http://libopenraw.freedesktop.org/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('8fb6c6230a4862b8c82b4b76be6ffb1e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -m755 -d ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 ${startdir}/src/${pkgname}-${pkgver}/COPYING \
  	${startdir}/pkg/usr/share/licenses/${pkgname}/ || return 1
}
