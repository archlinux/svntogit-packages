# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=libgtkhtml
pkgver=2.11.1
pkgrel=1
pkgdesc="An HTML library for GTK"
arch=(i686 x86_64)
license=('LGPL')
depends=('gail>=1.18.0-2')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.11/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a1d1a197dcff8c4571659deef5495e24')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
