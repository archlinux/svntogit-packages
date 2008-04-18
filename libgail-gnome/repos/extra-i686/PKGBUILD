# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgail-gnome
pkgver=1.20.0
pkgrel=2
pkgdesc="GNOME Accessibility Implementation Library for gnomeui and libbonoboui"
arch=(i686 x86_64)
license=('LGPL')
depends=('gnome-panel>=2.22.0' 'at-spi>=1.22.0')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool')
groups=('gnome')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/1.20/${pkgname}-${pkgver}.tar.bz2)
md5sums=('5a7662e3d637c86baa95a50adb225e56')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var  || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
