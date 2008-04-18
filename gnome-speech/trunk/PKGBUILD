# $Id$
# Maitnainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-speech
pkgver=0.4.18
pkgrel=1
pkgdesc="Gnome Text-to-Speech"
arch=(i686 x86_64)
license=('LGPL')
url="http://www.gnome.org"
depends=('libbonobo>=2.22.0')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.4/${pkgname}-${pkgver}.tar.bz2)
md5sums=('f325037fdc74e19d943f397066454ac3')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
