#$Id: PKGBUILD,v 1.12 2007/12/30 14:05:59 andyrtr Exp $
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=swfdec-mozilla
pkgver=0.5.5
pkgrel=2
pkgdesc="free plugin for Mozilla browsers that uses the Swfdec library for playing SWF files"
arch=('i686' 'x86_64')
url="http://swfdec.freedesktop.org"
license=('LGPL')
depends=("swfdec=$pkgver")
source=(http://swfdec.freedesktop.org/download/swfdec-mozilla/0.5/${pkgname}-${pkgver}.tar.gz)
options=('!libtool')
md5sums=('37d2b4235dd8c66de8f9ebd323aa6b1e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure  --prefix=/usr --disable-static --with-plugin-dir=/usr/lib/mozilla/plugins/
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
