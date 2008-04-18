# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=kbproto
pkgver=1.0.3
pkgrel=1
pkgdesc="X11 XKB extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('6092cdb0a1225f95356ddbe6c2abaad5')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
