# $Id$
# Maintainer: Jan De Groot <jgc@archlinux.org>

pkgname=gucharmap
pkgver=2.22.1
pkgrel=1
pkgdesc="Gnome Unicode Charmap"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org"
depends=('gconf>=2.22.0')
makedepends=('perlxml' 'gnome-doc-utils>=0.12.2' 'pkgconfig')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
install=gucharmap.install
source=(http://ftp.gnome.org/pub/gnome/sources/gucharmap/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('cd5f6ae44d29a7582dc179ebc64b42b4')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --disable-scrollkeeper || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
