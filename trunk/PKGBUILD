# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=libcddb
pkgver=1.3.0
pkgrel=3
pkgdesc="Libcddb is a library that implements the different protocols (CDDBP, HTTP, SMTP) to access data on a CDDB server (e.g. http://freedb.org)."
arch=(i686 x86_64)
license=('LGPL')
options=('!libtool')
depends=('glibc')
source=(http://heanet.dl.sourceforge.net/sourceforge/libcddb/${pkgname}-${pkgver}.tar.bz2)
url="http://sourceforge.net/projects/libcddb/"
md5sums=('e4a7f9579956c32b7f300eb12e9ea6df')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
