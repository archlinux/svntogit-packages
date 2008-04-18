# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-chips
pkgver=1.1.1
pkgrel=4
pkgdesc="X.org Chips and Technologies video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=(glibc)
makedepends=('pkgconfig' 'xorg-server>=1.1.1')
groups=('xorg-video-drivers')
options=('nolibtool')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)
md5sums=('3182d43439ca4cbf08ff9aa76990bba3')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
