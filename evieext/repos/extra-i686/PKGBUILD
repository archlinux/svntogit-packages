# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=evieext
pkgver=1.0.2
pkgrel=1
pkgdesc="X11 Event Interception extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('2507b5d0f4b2848147fbddd155aa6cfe')
sha1sums=('1ab4048ffbfb6b69e88d2f0f2cab7ca60e50cc99')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
