# $Id$
# Maintainer: Jan de Groot <jan@archlinux.org>

pkgname=at-spi
pkgver=1.22.1
pkgrel=1
pkgdesc="Assistive Technology Service Provider Interface"
arch=(i686 x86_64)
license=('GPL')
depends=('libbonobo>=2.22.0' 'libxevie' 'libxtst' 'libsm' 'gtk2>=2.12.9')
makedepends=('perlxml' 'pkgconfig' 'gail>=1.22.1' 'python>=2.5')
options=('!libtool')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/1.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('2ee1b35ef25e753e6bac840a418608f5')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --libexecdir=/usr/lib/at-spi || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
