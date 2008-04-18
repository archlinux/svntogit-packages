#$Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>

pkgname=gnome-vfsmm
pkgver=2.22.0
pkgrel=1
pkgdesc="A C++ wrapper for gnome-vfs."
arch=(i686 x86_64)
license=('LGPL')
depends=('gnome-vfs>=2.22.0' 'glibmm>=2.16.0')
makedepends=('pkgconfig' 'doxygen')
options=('!libtool')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('80b86e6f88ee0bd3a1babb686d0be03a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
