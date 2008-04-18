# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libglade
pkgver=2.6.2
pkgrel=1
pkgdesc="Allows you to load glade interface files in a program at runtime"
arch=(i686 x86_64)
license=('LGPL')
depends=('gtk2' 'libxml2')
makedepends=('python' 'pkgconfig')
options=('!libtool')
install=glade.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.6/${pkgname}-${pkgver}.tar.bz2
	libglade-2.0.1-nowarning.patch)
url="http://www.gnome.org"
md5sums=('da4f9d1c6cd1337f6ef5e2db768d8557' '4f879c0ce550004905aa0fb24f25c353')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/libglade-2.0.1-nowarning.patch || return 1
  ./configure --sysconfdir=/etc --prefix=/usr --localstatedir=/var
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -m755 libglade-convert ${startdir}/pkg/usr/bin/libglade-convert
}
