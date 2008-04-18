# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-fonts-encodings
pkgver=1.0.2
pkgrel=2
pkgdesc="X.org font encoding files"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('xorg-font-utils')
install="xorg-fonts-encodings.install"
source=(${url}/releases/individual/font/encodings-${pkgver}.tar.bz2)
md5sums=('11adda157b03d63fd61d95ad7ef00466')

build() {
  cd ${startdir}/src/encodings-${pkgver}
  ./configure --prefix=/usr \
              --with-encodingsdir=/usr/share/fonts/encodings
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
