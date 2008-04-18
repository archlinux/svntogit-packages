# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=fontforge
pkgver=20080330
pkgrel=1
pkgdesc="An outline and bitmap font editor"
arch=('i686' 'x86_64')
url="http://fontforge.sourceforge.net"
license=('BSD')
depends=('libxkbui' 'libxi')
makedepends=('freetype2')
options=('!libtool' '!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/fontforge/fontforge_full-${pkgver}.tar.bz2)
md5sums=('f1283d157327779cd864442107a8329d')
sha1sums=('0207392300bda80b15fb50e79fc1f09d1e92a0e4')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man --with-multilayer --with-devicetables --without-python
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m644 LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
}
