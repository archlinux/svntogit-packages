# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xcmiscproto
pkgver=1.1.2
pkgrel=1
pkgdesc="X11 XC-Miscellaneous extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('fde0b050901f024b19159cdacdcfbd20')
sha1sums=('825ec15986cd1ab008b11f6379eb4c7f3c78bd76')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
