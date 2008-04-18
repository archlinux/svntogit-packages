# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-device-manager
pkgver=0.2
pkgrel=1
pkgdesc="GNOME Device Manager, replaces hal-device-manager"
arch=(i686 x86_64)
license=('GPL')
depends=('libgnomeui' 'hal>=0.5.10')
makedepends=('perlxml' 'pkgconfig' 'gnome-doc-utils>=0.12.0')
replaces=('hal-device-manager')
options=('!libtool' '!emptydirs')
install=gnome-device-manager.install
url="http://www.gnome.org"
source=(http://hal.freedesktop.org/releases/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper \
	      --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
