# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=renderproto
pkgver=0.9.3
pkgrel=1
pkgdesc="X11 Render extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(http://xorg.freedesktop.org/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('598bc9a493deee2e48e4434e94467189')
