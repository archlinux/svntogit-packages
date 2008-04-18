# $Id$
# Maintainer: Tobias Powalowski  <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
pkgname=synaptics
pkgver=0.14.6.99
pkgrel=2
pkgdesc="synaptics driver for notebook touchpads"
arch=(i686 x86_64)
url="http://w1.894.telia.com/~u89404340/touchpad/"
depends=('libxext' 'libx11')
makedepends=('pkgconfig' 'xorg-server')
source=(http://w1.894.telia.com/~u89404340/touchpad/files/${pkgname}-0.14.6.tar.bz2 \
        synaptics-0.14.6.99-git-master.patch xinerama-fix.patch)
install="synaptics.install"

build() {
  cd ${startdir}/src/${pkgname}-0.14.6
  patch -Np1 -i ${startdir}/src/synaptics-0.14.6.99-git-master.patch || return 1
  # fix http://bugs.archlinux.org/task/8732
  patch -Np0 -i ../xinerama-fix.patch || return 1
  # make synaptics play nice with pixman and it's -1
  sed -i -e 's:ALLINCLUDES = :ALLINCLUDES = -I/usr/include/pixman-1 :g' Makefile

  make BUILD_MODULAR=y || return 1
  make DESTDIR=${startdir}/pkg/ \
       BINDIR=${startdir}/pkg/usr/bin \
       MANDIR=${startdir}/pkg/usr/man/ install
}
md5sums=('1102cd575045640a064ab6f9b1e391af'
         '3a88281ace381f9e105a5ff2bdd706a7'
         '0cc00b308a79daab468ad8bd46496b4e')
