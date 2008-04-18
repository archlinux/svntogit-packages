# $Id$
# Mantainer: Jan de Groot <jgc@archlinux.org>

pkgname=pyorbit
pkgver=2.14.3
pkgrel=1
pkgdesc="Python bindings for ORBit2"
arch=(i686 x86_64)
license=('LGPL')
url="http://www.pygtk.org"
depends=('python>=2.5' 'orbit2>=2.14.7-2')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/pyorbit/2.14/${pkgname}-${pkgver}.tar.bz2)
md5sums=('3c4d42ae1a7303fd85071a842617043f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
