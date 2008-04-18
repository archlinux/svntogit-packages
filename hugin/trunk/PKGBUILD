# $Id$
# Maintainer: tobias <tobias@archlinux.org>
#Contributor: Dominik Ryba <domryba@post.pl>

pkgname=hugin
pkgver=0.7_beta4
pkgrel=3
pkgdesc="A frontend to the panorama-tools"
arch=(i686 x86_64)
license=('LGPL')
depends=('wxgtk>=2.8.0.1' 'libpano13' 'boost')
makedepends=('zip')
url="http://hugin.sourceforge.net/"
install=${pkgname}.install
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('28b69d85ae06a22fe9514f7f77e6dddb')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  #sed -i 's:m4/codeset.*$::' Makefile.in
  ./configure --prefix=/usr --with-unicode=yes
  sed -i 's|autopanog\.exe|autopano|' src/include/hugin/config_defaults.h
  make || return 1
  sed -i 's/ install-data-hook//' src/hugin/Makefile
  make DESTDIR=${startdir}/pkg install
}
