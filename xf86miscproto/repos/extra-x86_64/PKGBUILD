# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86miscproto
pkgver=0.9.2
pkgrel=1
pkgdesc="X11 XFree86-Miscellaneous extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('acae8edeb05a406f7f60bcbb218a8f1d')
sha1sums=('bfaf893bb97085c79ef84e9911c97d11b2a4fdbe')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
