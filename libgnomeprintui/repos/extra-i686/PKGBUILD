# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgnomeprintui
pkgver=2.18.2
pkgrel=1
pkgdesc="User Interface library for printing with GNOME"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('libgnomeprint>=2.18.3' 'libgnomecanvas>=2.20.0' 'gnome-icon-theme>=2.20.0')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.18/${pkgname}-${pkgver}.tar.bz2)
md5sums=('88b404e7b62bb9ad96b25908c1315dcd')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
