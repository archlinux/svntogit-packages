# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=icon-naming-utils
pkgver=0.8.6
pkgrel=1
pkgdesc="Maps the new names of icons for Tango to the legacy names used by the GNOME and KDE desktops."
arch=(i686 x86_64)
license=('GPL')
url="http://tango-project.org"
depends=('perl-xml-simple')
source=(http://tango.freedesktop.org/releases/${pkgname}-${pkgver}.tar.bz2)
md5sums=('1b255dbd674954a00d20434568da45ac')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/icon-naming-utils \
	      --localstatedir=/var
  make || return 1
  make DESTDIR=${startdir}/pkg install
  mv ${startdir}/pkg/usr/share/pkgconfig ${startdir}/pkg/usr/lib/pkgconfig
}
