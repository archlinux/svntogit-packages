# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xproto
pkgver=7.0.12
pkgrel=1
pkgdesc="X11 core wire protocol and auxiliary headers"
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
md5sums=('388234421add6c1760b4fc99fcdc76b0')
