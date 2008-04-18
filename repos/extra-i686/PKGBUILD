# $Id$
# Contributor: Johannes Weiner <hannes@saeurebad.de>

pkgname=libsigsegv
pkgver=2.4
pkgrel=1
arch=('i686')
pkgdesc="Page fault detection library"
url="http://libsigsegv.sourceforge.net/"
license=('GPL')
depends=('glibc')
options=('!libtool')
source=(http://ftp.gnu.org/gnu/libsigsegv/libsigsegv-${pkgver}.tar.gz)
md5sums=('df0fe5f87a01e0b4b53b2cdfa8a730e1')

build() {
  cd ${startdir}/src/libsigsegv-${pkgver}
  ./configure --prefix=/usr --enable-shared
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
