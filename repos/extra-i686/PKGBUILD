# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=compositeproto
pkgver=0.4
pkgrel=1
pkgdesc="X11 Composite extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=(fixesproto)
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

md5sums=('6281344d656d4e0c8e9db4918efe3d1d')
