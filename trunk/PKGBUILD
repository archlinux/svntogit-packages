# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libnotify
pkgver=0.4.4
pkgrel=2
pkgdesc="Desktop notification library"
arch=(i686 x86_64)
license=('LGPL')
depends=('dbus-glib>=0.74' 'gtk2>=2.12.9')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://www.galago-project.org/files/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.gz)
url="http://www.galago-project.org/"
md5sums=('ba76f68b7e3bd284ac2c2a1b9c5ecb06')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
