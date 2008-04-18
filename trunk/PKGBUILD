# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgtop
pkgver=2.22.1
pkgrel=1
pkgdesc="A library that read information about processes and the running system"
arch=(i686 x86_64)
license=('LGPL')
depends=('glib2>=2.16.3' 'libxau')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
options=('!libtool')
url="http://www.gnome.org/"
md5sums=('d157224c951f1284132361e50a8195b5')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --with-libgtop-smp --with-libgtop-inodedb \
	      --with-linux-table || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
