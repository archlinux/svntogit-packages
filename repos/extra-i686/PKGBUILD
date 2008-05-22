# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=printproto
pkgver=1.0.4
pkgrel=1
pkgdesc="X11 print extension wire protocol"
arch=(i686 x86_64)
license=('custom')
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  install -D -m644 ${startdir}/src/${pkgname}-${pkgver}/COPYING \
                   ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
md5sums=('7321847a60748b4d2f1fa16db4b6ede8')
