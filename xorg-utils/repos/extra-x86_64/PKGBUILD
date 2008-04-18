# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xorg-utils
pkgver=1.0.2
pkgrel=4
pkgdesc="Collection of client utilities used to query the X server"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxxf86dga' 'libxi' 'libxxf86misc' 'libxtst' 'libxinerama' 'libxv'
         'libdmx' 'libxft' 'libxaw')
makedepends=('pkgconfig' 'mesa')
source=(${url}/releases/individual/app/xdpyinfo-1.0.1.tar.bz2
        ${url}/releases/individual/app/xdriinfo-1.0.2.tar.bz2
        ${url}/releases/individual/app/xev-1.0.2.tar.bz2
        ${url}/releases/individual/app/xfd-1.0.1.tar.bz2
        ${url}/releases/individual/app/xfontsel-1.0.2.tar.bz2
        ${url}/releases/individual/app/xlsatoms-1.0.1.tar.bz2
        ${url}/releases/individual/app/xlsclients-1.0.1.tar.bz2
        ${url}/releases/individual/app/xlsfonts-1.0.2.tar.bz2
        ${url}/releases/individual/app/xprop-1.0.3.tar.bz2
        ${url}/releases/individual/app/xvinfo-1.0.2.tar.bz2
        ${url}/releases/individual/app/xwininfo-1.0.2.tar.bz2)

build() {
  cd ${startdir}/src
  for i in *; do
    if [ -d "${i}" ]; then
      pushd "${i}"
      ./configure --prefix=/usr
      make || return 1
      make DESTDIR=${startdir}/pkg install || return 1
      popd
    fi
  done
}
md5sums=('84cc4798fe62c1d8c67c3f38e8158f70'
         'a5ec51ed9f0a55dc3462d90d52ff899c'
         'e3008eb0655da3026c162a5597d70869'
         'c72abd90f50ef459bc14b39ec9fcc7f8'
         '288fe4cf8a990e4e602aac16dd9109fb'
         '69adcda848479acc3b82b3928812d191'
         '44473b880d26bfbe8b3d4d72b183cba7'
         '28958248590ff60ecd70e8f590d977b7'
         'e7b16eeb4bab974e3592d62f415aa6a5'
         'e1e318436f49e2f0f3764593dadd9ad2'
         'e5dbc8866a55958297f5f38205b6be1e')
