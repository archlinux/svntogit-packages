# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xineramaproto
pkgver=1.1.2
pkgrel=1
pkgdesc="X11 Xinerama extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('1cc292c562962ad0ad3a253cae68c632')
sha1sums=('d09ef306ffc0d058120051d88dd64776fd0de0d5')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
