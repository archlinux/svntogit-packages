# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgnomeui
pkgver=2.22.1
pkgrel=1
pkgdesc="User Interface library for GNOME"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libbonoboui>=2.22.0' 'gnome-keyring>=2.22.1')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool' 'force')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('5a60405f006e873ba7bc97ec9c8e4c5d')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --libexecdir=/usr/lib/libgnomeui || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
