# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86vidmodeproto
pkgver=2.2.2
pkgrel=1
pkgdesc="X11 Video Mode extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('f00844a63d6e76b69eb0eb5e41eed843')
sha1sums=('4a228958879eb06206d13f4f09ec902f837fb8dd')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
