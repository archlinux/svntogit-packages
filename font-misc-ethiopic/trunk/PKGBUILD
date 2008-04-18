# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=font-misc-ethiopic
pkgver=1.0.0
pkgrel=4
pkgdesc="X.org Misc Ethiopic fonts"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('MIT')
depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
install=xfonts.install
source=(http://xorg.freedesktop.org/releases/individual/font/${pkgname}-${pkgver}.tar.bz2 LICENSE)
md5sums=('0b271fc617087d77560bdca20c0cdbb0' '059abd0312fb05b4ae583a5d0b8df49e')
sha1sums=('d598b873ea897574b86167a36b4c151f84d22d68' '1015aac496f1270a076b07e021f3e2ec8fbe028a')
build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --with-mapfiles=/usr/share/fonts/util \
	      --with-ttf-fontdir=/usr/share/fonts/TTF \
	      --with-otf-fontdir=/usr/share/fonts/OTF
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  rm -f ${startdir}/pkg/usr/share/fonts/*/fonts.*
  install -D -m644 ../LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
}
