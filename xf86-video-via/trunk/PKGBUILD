# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xf86-video-via
pkgver=0.2.2
pkgrel=4
pkgdesc="X.org via video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('unichrome-dri')
makedepends=('pkgconfig' 'xorg-server>=1.4.0.90' 'xf86driproto' 'libxvmc' 'mesa>=7.0.3rc3')
options=('!libtool')
groups=('xorg-video-drivers')
source=(${url}/releases/individual/driver/${pkgname}-${pkgver}.tar.bz2)
md5sums=('d5fe25d3cfa0a64cc77681f15f9c3159')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --enable-dri \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
