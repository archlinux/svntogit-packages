# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Rouslan Solomakhin <rouslan@localnet.com>
# Contributor: dorphell <dorphell@archlinux.org>
pkgname=oxine
pkgver=0.7.1
pkgrel=1
pkgdesc="oxine is a lightweight, purely osd based xine frontend for set-top boxes and home entertainment systems."
arch=('i686' 'x86_64')
depends=('xine-lib' 'libexif' 'eject' 'libcdio' 'curl' 'libxinerama')
makedepends=('pkgconfig')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/oxine/${pkgname}-${pkgver}.tar.gz)
url="http://oxine.sourceforge.net/"

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
md5sums=('2a2d05ee21892624e35cf539e532c0dd')
