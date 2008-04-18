# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-input-jamstudio
pkgver=1.1.0
pkgrel=4
pkgdesc="X.Org KB-Gear JamStudio pentablet input driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server>=1.1.1')
options=('nolibtool')
groups=('xorg-input-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a32e36a24545791a3408cdc5563b6523')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
