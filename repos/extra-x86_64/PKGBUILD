# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=imake
pkgver=1.0.2
pkgrel=2
force=y
pkgdesc="X.Org imake program and related utilities"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=(glibc)
makedepends=(pkgconfig xproto perl)
source=(http://xorg.freedesktop.org/releases/individual/util/imake-1.0.2.tar.bz2
	http://xorg.freedesktop.org/releases/individual/util/gccmakedep-1.0.2.tar.bz2
	http://xorg.freedesktop.org/releases/individual/util/lndir-1.0.1.tar.bz2
	http://xorg.freedesktop.org/releases/individual/util/makedepend-1.0.1.tar.bz2
	http://xorg.freedesktop.org/releases/individual/util/xorg-cf-files-1.0.2.tar.bz2
	linuxconfig.patch)

build() {
  cd ${startdir}/src/xorg-cf-files-*
  patch -Np1 -i ${startdir}/src/linuxconfig.patch || return 1
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
md5sums=('02fea5a02ba2857c7d81820c8e8b8e6f'
         'b533c0771dbbaf9b041ff35bb941d3a2'
         'e274ea9f55dfd62afa0a7b1e1ab4ba96'
         '54ab2549d723e51ff2b9cff4d8bf44d1'
         '5f62dd5545b782c74f6e4e70d0e6552c'
         '1b1d7653ac95d4b479784afcd61a889f')
