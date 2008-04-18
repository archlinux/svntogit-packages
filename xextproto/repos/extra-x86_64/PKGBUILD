# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xextproto
pkgver=7.0.2
pkgrel=1
pkgdesc="X11 various extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('242388ab65dde3a3dd313eeee265e429')
sha1sums=('724c82cb9f393ae3cf71a178c328608b17ccccac')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
