# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=libgsf
pkgver=1.14.8
pkgrel=1
pkgdesc="The GNOME Structured File Library is a utility library for reading and writing structured file formats."
arch=(i686 x86_64)
url="http://www.gnome.org/"
license=('GPL' 'LGPL')
depends=('libxml2' 'glib2>=2.16.1' 'bzip2')
makedepends=('perlxml' 'pkgconfig' 'python')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/1.14/${pkgname}-${pkgver}.tar.bz2)
md5sums=('09e4b6639be79fa888cabc751f73674f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  sed -i -e 's/gsf-gnome gsf-win32//' -e 's/thumbnailer//' Makefile.*
  ./configure --prefix=/usr --disable-gtk-doc --without-gnome --without-bonobo
  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm -f ${startdir}/pkg/usr{,/share}/man/man1/gsf-office-thumbnailer.1
}
