# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxdamage
pkgver=1.1.1
pkgrel=1
pkgdesc="X11 damaged region extension library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxfixes>=4.0.3' 'damageproto>=1.1')
makedepends=('pkgconfig')
options=('!libtool')
source=(${url}/releases/individual/lib/libXdamage-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libXdamage-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('ac0ce6b0063a9858c8f24ddb4c60487d')
