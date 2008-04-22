# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=abiword
pkgver=2.6.2
pkgrel=1
pkgdesc="A fully-featured word processor"
arch=(i686 x86_64)
license=('GPL')
url="http://www.abisource.com"
depends=('libsm' 'fribidi>=0.10.9' 'enchant>=1.3.0' 'libgnomeprintui' 'wv>=1.2.4'
        'libgnomeui>=2.22.01' 'libgsf-gnome>=1.14.8')
makedepends=('pkgconfig')
source=(http://www.abisource.com/downloads/abiword/${pkgver}/source/${pkgname}-${pkgver}.tar.gz)
md5sums=('8e756c0529880fbe6ea3aaef8d5df0b5')

build() {
  export MAKEFLAGS="-j1"
  cd ${startdir}/src/${pkgname}-${pkgver}/
  ./configure --prefix=/usr --with-libxml2 --disable-gucharmap --with-sys-wv
  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm -rf ${startdir}/pkg/usr/lib
  mv ${startdir}/pkg/usr/share/icons ${startdir}/pkg/usr/share/pixmaps
}
