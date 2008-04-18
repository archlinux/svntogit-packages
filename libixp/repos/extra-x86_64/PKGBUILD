# $Id$
# Maintainer: Jeff Mickey <jeff@archlinux.org>
# Thanks to Alessio 'mOLOk' Bolognino

pkgname=libixp
pkgver=0.4
pkgrel=1
pkgdesc="A standalone client/server 9p library"
arch=('i686' 'x86_64')
url="http://libs.suckless.org"
license=('MIT')
source=(http://libs.suckless.org/download/libixp-$pkgver.tar.gz) 
options=(!makeflags)

build() {
  cd $startdir/src/libixp-$pkgver
  sed -i \
        -e "/^PREFIX/s|=.*|= ${startdir}/pkg/usr|" \
        -e "/^ETC/s|=.*|= ${startdir}/pkg/etc|" \
        -e "/^CFLAGS/s|=|+=|" \
        -e "/^LDFLAGS/s|=|+=|" \
        config.mk || return 1

  make -j1 || return 1
  make -j1 DESTDIR=$startdir/pkg install

  install -m644 -D ./libixp/LICENSE \
                   $startdir/pkg/usr/share/licenses/libixp/LICENSE
}

md5sums=('59d9e918adffaf4413b32ac4f66724fd')
sha1sums=('ec1adfeb4c5f502dfcb1b99fcf440841ecee2f9a')
