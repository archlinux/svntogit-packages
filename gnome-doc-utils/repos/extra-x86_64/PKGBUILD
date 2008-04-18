# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-doc-utils
pkgver=0.12.2
pkgrel=1
pkgdesc="Documentation utilities for Gnome"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('libxslt>=1.1.22' 'python>=2.5' 'docbook-xml' 'rarian>=0.8.0')
makedepends=('pkgconfig' 'perlxml')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.12/${pkgname}-${pkgver}.tar.bz2)
md5sums=('e1a9e9ba923b8950f8803c90ebeaadb8')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
