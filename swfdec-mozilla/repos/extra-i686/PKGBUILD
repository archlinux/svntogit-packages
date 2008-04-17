#$Id: PKGBUILD,v 1.13 2008/03/17 20:07:41 andyrtr Exp $
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=swfdec-mozilla
pkgver=0.6.0
pkgrel=2
pkgdesc="free plugin for Mozilla browsers that uses the Swfdec library for playing SWF files"
arch=('i686' 'x86_64')
url="http://swfdec.freedesktop.org"
license=('LGPL')
depends=("swfdec>=$pkgver")
source=(http://swfdec.freedesktop.org/download/swfdec-mozilla/0.6/${pkgname}-${pkgver}.tar.gz)
options=('!libtool')
md5sums=('dc0fb84b5e5c7540ae1231eb04109f0e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure  --prefix=/usr --disable-static --with-plugin-dir=/usr/lib/mozilla/plugins/
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
