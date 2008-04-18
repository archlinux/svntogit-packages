# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-input-mutouch
pkgver=1.1.0
pkgrel=4
pkgdesc="X.org mutouch input driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server>=1.1.1')
groups=('xorg-input-drivers')
options=('nolibtool')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)
md5sums=('98ae915c67cabf0e6d40a425dbdbe10b')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
