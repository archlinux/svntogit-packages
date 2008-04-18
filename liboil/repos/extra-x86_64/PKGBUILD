# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=liboil
pkgver=0.3.14
pkgrel=1
pkgdesc="Library of simple functions that are optimized for various CPUs."
arch=('i686' 'x86_64')
license=('custom')
url="http://liboil.freedesktop.org/"
depends=('glibc')
makedepends=('glib2' 'pkgconfig' 'docbook-xsl')
options=('!libtool' '!makeflags')
source=(${url}/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('7a9f719e50656b795c06c0167012a84f')

build() {
  unset CFLAGS
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -m755 -d ${startdir}/pkg/usr/share/licenses/liboil
  install -m644 COPYING ${startdir}/pkg/usr/share/licenses/liboil/
}
