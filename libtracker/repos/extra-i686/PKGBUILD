# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libtracker
pkgver=0.6.6
pkgrel=1
pkgdesc="Interface library for the tracker indexer"
arch=(i686 x86_64)
license=('LGPL')
depends=('dbus-glib>=0.74')
makedepends=('pkgconfig' 'perlxml' 'gmime' 'sqlite3')
source=(http://www.gnome.org/~jamiemcc/tracker/tracker-${pkgver}.tar.bz2)
options=('!libtool')
url="http://www.gnome.org/projects/tracker/"
md5sums=('0845998f8f0d715b3f1b306d59fdae4d')

build() {
  cd ${startdir}/src/tracker-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  pushd src/libtracker || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  popd
  install -m755 -d ${startdir}/pkg/usr/lib/pkgconfig
  install -m644 tracker.pc ${startdir}/pkg/usr/lib/pkgconfig/ || return 1
  rm -rf ${startdir}/pkg/usr/bin
}
