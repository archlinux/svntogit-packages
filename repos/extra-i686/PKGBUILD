# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgnomecanvas
pkgver=2.20.1.1
pkgrel=1
pkgdesc="The GNOME Canvas library"
arch=(i686 x86_64)
license=('LGPL')
depends=('libglade>=2.6.2' 'libart-lgpl>=2.3.20' 'gail>=1.22.0')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.20/${pkgname}-${pkgver}.tar.bz2)
md5sums=('948ed771d2957d24a0c9a414e9581055')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
