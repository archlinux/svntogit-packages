# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=trapproto
pkgver=3.4.3
pkgrel=1
pkgdesc="X11 Trap extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(http://xorg.freedesktop.org/releases/individual/proto/${pkgname}-$pkgver.tar.bz2)
md5sums=('3b713239e5e6b269b31cb665563358df')
sha1sums=('b108aa39a7bfde530d5cd347fda7c58770d5b8da')

build() {
  cd $startdir/src/${pkgname}-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
