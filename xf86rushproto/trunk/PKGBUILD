# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86rushproto
pkgver=1.1.2
pkgrel=1
pkgdesc="X11 Rush extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('b6a96ffdae084e27487a58314008b000')
sha1sums=('756838c1269412881f23727ac18dd088bb7ce183')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
