# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xf86-video-ark
pkgver=0.7.0
pkgrel=1
pkgdesc="X.org ark video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server>=1.4.0.90')
options=('!libtool')
groups=('xorg-video-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('6826c556ebe9a1248cbc7f7edd44f956')
