#$Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libmms
pkgver=0.3
pkgrel=1
pkgdesc="Microsoft streaming procotols parsing library"
arch=(i686 x86_64)
url="http://www.sf.net/projects/libmms"
license=(LGPL)
depends=('glib2>=2.10.9')
options=('nolibtool')
source=(http://heanet.dl.sf.net/libmms/${pkgname}-${pkgver}.tar.gz)
md5sums=('1601705f38143687a575630a3f9d6a56')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
