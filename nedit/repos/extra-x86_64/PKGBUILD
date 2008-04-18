# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk> and Dale Blount <dale@archlinux.org>
# Maintainer: Dale Blount <dale@archlinux.org>
pkgname=nedit
pkgver=5.5
pkgrel=4
pkgdesc="A Unix text editor for programmers and general users"
arch=(i686 x86_64)
license=("GPL")
url="http://www.nedit.org/"
depends=(lesstif libxpm)
source=(ftp://ftp.nedit.org/pub/NEdit/v5_5/$pkgname-$pkgver-src.tar.bz2 nedit_xorg_composite_fix.patch)
md5sums=('48cb3dce52d44988f3a4d7c6f47b6bbe'
         'ae1f56ae9b23163882051720ac52412d')


build() {
  cd $startdir/src/$pkgname-$pkgver
  patch --verbose -p1 < $startdir/src/nedit_xorg_composite_fix.patch || return 1
  sed -i -e 's/-Wl,-Bstatic//' makefiles/Makefile.linux
  sed -i -e 's/0.93.0/0.94.4/' util/check_lin_tif.c
  sed -i -e "s/CFLAGS=-O/CFLAGS=${CFLAGS} -DBUILD_UNTESTED_NEDIT/" makefiles/Makefile.linux
  sed -i -e 's/"/bin/csh"/:"/bin/sh"/' source/preferences.c

  make linux || return 1
  mkdir -p $startdir/pkg/usr/{bin,man/man1}
  install -m755 source/nedit $startdir/pkg/usr/bin/nedit
  install -m755 source/nc $startdir/pkg/usr/bin/nedit-client
  install -m644 doc/nedit.man $startdir/pkg/usr/man/man1/nedit.1
  install -m644 doc/nc.man $startdir/pkg/usr/man/man1/nedit-client.1
}
