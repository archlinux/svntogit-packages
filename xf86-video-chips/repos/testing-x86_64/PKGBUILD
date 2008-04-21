# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xf86-video-chips
pkgver=1.2.0
pkgrel=1
pkgdesc="X.org Chips and Technologies video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=(glibc)
makedepends=('pkgconfig' 'xorg-server>=1.4.0.90')
groups=('xorg-video-drivers')
options=('!libtool')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('0fec6bee65383790485d917247a61629')
