# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=eel
pkgver=2.22.1
pkgrel=1
pkgdesc="Eazel Extensions Library is a collection of widgets and extensions for GNOME"
arch=(i686 x86_64)
license=('GPL')
depends=('gnome-desktop>=2.22.0')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('dd393ad7de2e230a7604af9560140920')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
