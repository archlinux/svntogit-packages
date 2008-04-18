# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=font-bh-ttf
pkgver=1.0.0
pkgrel=3
pkgdesc="X.org Luxi Truetype fonts"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
install=xfonts.install
source=(${url}/releases/individual/font/${pkgname}-${pkgver}.tar.bz2)
md5sums=('ad43cf739b3d46ba1e7dc778a0608a52')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --with-mapfiles=/usr/share/fonts/util \
	      --with-fontdir=/usr/share/fonts/TTF
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  rm ${startdir}/pkg/usr/share/fonts/*/fonts.*
}
