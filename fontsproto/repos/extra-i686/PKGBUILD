# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=fontsproto
pkgver=2.0.2
pkgrel=1
pkgdesc="X11 font extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c946f166107b016a21cc7a02e1132724')
sha1sums=('1244f63bd90668c7ddc88febbf4a220fd83ea492')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
