# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-input-palmax
pkgver=1.1.0
pkgrel=4
pkgdesc="X.org palmax input driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server>=1.1.1')
groups=('xorg-input-drivers')
options=('nolibtool')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)
md5sums=('0959dbf7972dfb95f56e4bd3f56447cf')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
