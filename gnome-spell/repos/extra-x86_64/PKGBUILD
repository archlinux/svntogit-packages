# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-spell
pkgver=1.0.8
pkgrel=1
pkgdesc="Spell Checking Support for Gnome"
arch=(i686 x86_64)
license=('GPL')
depends=('libgnomeui>=2.20.1' 'enchant>=1.3')
makedepends=('pkgconfig')
options=('!libtool')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/1.0/${pkgname}-${pkgver}.tar.bz2
	gnome-spell-enchant.diff)
md5sums=('6ccc46b4e3dc7cb1c6d413358e35d445' '12a357212809e0f0aba8c08d1372e60a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ${startdir}/src/gnome-spell-enchant.diff || return 1
  aclocal
  autoconf
  automake

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
