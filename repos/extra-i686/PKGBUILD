# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=damageproto
pkgver=1.1.0
pkgrel=1
pkgdesc="X11 Damage extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('xproto' 'fixesproto')
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('33ee591e0b1ca5ad7902934541db7d24')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
