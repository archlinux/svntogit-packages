# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=font-bitstream-speedo
pkgver=1.0.0
pkgrel=4
pkgdesc="Bitstream Speedo fonts"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
install=xfonts.install
source=(http://xorg.freedesktop.org/releases/individual/font/${pkgname}-${pkgver}.tar.bz2)
md5sums=('1399dc18aeb9571b0951d9570ea1059d')
sha1sums=('e7d654b7844d3343f15bfb4807253d385fcdda49')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --with-mapfiles=/usr/share/fonts/util \
	      --with-fontdir=/usr/share/fonts/speedo
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  rm ${startdir}/pkg/usr/share/fonts/*/fonts.*
  install -D -m644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
