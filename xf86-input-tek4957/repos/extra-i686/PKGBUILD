# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-input-tek4957
pkgver=1.1.0
pkgrel=4
pkgdesc="X.org tek4957 input driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server>=1.1.1')
groups=('xorg-input-drivers')
options=('nolibtool')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)
md5sums=('be8a4bd474ad6c85b93f66dd6fcfa6ee')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
