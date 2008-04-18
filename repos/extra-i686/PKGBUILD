# $Id$
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=libgpod
pkgver=0.6.0
pkgrel=2
pkgdesc="libgpod is a shared library to access the contents of an iPod"
arch=(i686 x86_64)
license=('LGPL')
depends=('gtk2>=2.10.14' 'mutagen' 'sg3_utils')
makedepends=('perlxml' 'swig')
url="http://www.gtkpod.org/libgpod.html"
source=(http://downloads.sourceforge.net/sourceforge/gtkpod/${pkgname}-${pkgver}.tar.gz 
	add_string.patch)
md5sums=('b44d8aee3f6610370b6faf61770c5f3c'
         '0accf863699c12ae538df9e70467df06')
options=(!libtool)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ../add_string.patch || return 1
  ./configure --prefix=/usr
  make PREFIX=/usr || return 1
  make PREFIX=/usr DESTDIR=${startdir}/pkg install || return 1
  sed -i -e 's|glib-2.0|gobject-2.0|' ${startdir}/pkg/usr/lib/pkgconfig/libgpod-1.0.pc
}
