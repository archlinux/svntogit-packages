# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=fontcacheproto
pkgver=0.1.2
pkgrel=1
pkgdesc="X11 font cache extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('60df6b625074a9790e28543dcea71651')
sha1sums=('6a531ef505ba2f7c1aa884bb4efdac3e32dfd99b')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
