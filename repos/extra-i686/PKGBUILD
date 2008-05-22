# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=inputproto
pkgver=1.4.3
pkgrel=1
pkgdesc="X11 Input extension wire protocol"
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
md5sums=('a0f0d8cf6fbf0db8ba3937d0cc16138d')
