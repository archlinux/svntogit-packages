# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xorg-xauth
pkgver=1.0.2
pkgrel=1
pkgdesc="X.Org authorization settings program"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxmu')
makedepends=('pkgconfig')
source=(${url}/releases/individual/app/xauth-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/xauth-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

md5sums=('31b956edaeb453ddaa640420e97b25b2')
