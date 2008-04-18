# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=xmame-sdl
pkgver=0.106
pkgrel=2
pkgdesc="Multiple Arcade Machine Emulator."
arch=(i686 x86_64)
url='http://x.mame.net'
depends=('expat>=2.0' 'sdl' 'zlib')
source=(http://x.mame.net/download/xmame-${pkgver}.tar.bz2
	makefile.unix.patch)
md5sums=('b2b18d32a03ebd4d9c9476fbb93695ca' '8a847e2bd051a7a08736e4d5c24a1903')

build() {
  cd ${startdir}/src/xmame-${pkgver}
  patch -Np0 -i ${startdir}/src/makefile.unix.patch || return 1
  [ -z "${CC}" ] || sed -i "s/CC\t= gcc/CC\t= ${CC}/" makefile.unix
  sed -i "s/^CFLAGS =/CFLAGS = ${CFLAGS}/" makefile.unix

  make PREFIX=/usr || return 1
  make PREFIX=${startdir}/pkg/usr install

  # symlink for xmame
  cd ${startdir}/pkg/usr/bin
  ln -s xmame.SDL xmame

  chown -R root:root ${startdir}/pkg/usr
}
