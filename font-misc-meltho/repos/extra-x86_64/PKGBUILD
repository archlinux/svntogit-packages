# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=font-misc-meltho
pkgver=1.0.0
pkgrel=4
pkgdesc="X.org Misc Meltho fonts"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
install=xfonts.install
source=(http://xorg.freedesktop.org/releases/individual/font/${pkgname}-${pkgver}.tar.bz2)
md5sums=('ccb212a7badf7aefdc9f9a92af428d32')
sha1sums=('fb7bb1ef32a1b7eacd2df4c372967706cd730a92')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --with-mapfiles=/usr/share/fonts/util \
	      --with-fontdir=/usr/share/fonts/OTF
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  rm -f ${startdir}/pkg/usr/share/fonts/*/fonts.*
  install -D -m644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
