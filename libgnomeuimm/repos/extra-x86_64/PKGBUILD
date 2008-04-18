# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>

pkgname=libgnomeuimm
pkgver=2.22.0
pkgrel=1
pkgdesc="A C++ wrapper for libgnomeui."
arch=(i686 x86_64)
license=('GPL')
depends=('libgnomeui>=2.22.01' 'libgnomecanvasmm>=2.22.0' 'libgnomemm>=2.22.0' 'libglademm>=2.6.6' 'gconfmm>=2.22.0' 'gnome-vfsmm>=2.22.0')
makedepends=('pkgconfig')
options=('!libtool')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('74b22fd00133e683ffa23b060d1862e7')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
