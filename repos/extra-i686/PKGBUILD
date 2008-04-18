# $Id$
# Maintainer: Arjan Timmerman <arjan@soufly.nl>
# Contributer: Tor Krill
pkgname=autogen
pkgver=5.8.8
pkgrel=2
pkgdesc="A tool designed to simplify the creation and maintenance of programs that contain large amounts of repetitious text."
arch=(i686 x86_64)
url="http://autogen.sourceforge.net/"
license=(GPL)
depends=('guile>=1.8.1' 'libxml2>=2.6.26' 'libtool>=2.2')
options=('!libtool' '!makeflags')
source=(http://switch.dl.sourceforge.net/autogen/${pkgname}-${pkgver}.tar.bz2)
md5sums=('fe078c23b26753347a31c0bee6e5c82c')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
} 
