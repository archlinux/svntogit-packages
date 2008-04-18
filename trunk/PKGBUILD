# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=vte
pkgver=0.16.13
pkgrel=1
pkgdesc="VTE - Virtual Terminal Emulator"
arch=(i686 x86_64)
license=('LGPL')
depends=('gtk2>=2.12.8-2' 'libsm')
options=('!libtool')
makedepends=('pygtk>=2.12.0' 'pkgconfig' 'perlxml')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/GNOME/sources/vte/0.16/vte-${pkgver}.tar.bz2
	vte-0.16.0-reaper-python-bindings.patch)
md5sums=('40480f20f6b7664f3d364e4f2ed27889' 'efe29cd40635e73fa3152f77d91a4f39')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/vte-0.16.0-reaper-python-bindings.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/vte \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
