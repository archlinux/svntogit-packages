# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libbonoboui
pkgver=2.22.0
pkgrel=1
pkgdesc="User Interface library for Bonobo"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('libgnomecanvas>=2.20.1.1' 'libgnome>=2.22.0')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('e4e4d74c9387d08c956574f981cf91f2')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  rm -f ${startdir}/pkg/usr/share/applications/bonobo-browser.desktop
}
