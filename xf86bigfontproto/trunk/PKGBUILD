# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86bigfontproto
pkgver=1.1.2
pkgrel=1
pkgdesc="X11 Big Fonts extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a318c1e86123832d7b0c95fc7d47ef35')
sha1sums=('4a2e84b3f529e4747dbc07bf4496bfe01f40aa85')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
