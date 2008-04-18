# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Patrick Leslie Polzer <leslie.polzer@gmx.net>

pkgname=libmodplug
pkgver=0.8.4
pkgrel=1
pkgdesc="A MOD playing library"
arch=(i686 x86_64)
url="http://modplug-xmms.sourceforge.net/"
license=('GPL')
depends=(gcc-libs)
source=(http://downloads.sf.net/sourceforge/modplug-xmms/libmodplug-${pkgver}.tar.gz)
md5sums=('091bd1168a524a4f36fc61f95209e7e4')
options=('!libtool')

build() {
  cd ${startdir}/src/libmodplug-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}

