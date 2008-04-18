# $Id$
# Mantainer: Jan de Groot <jgc@archlinux.org>

pkgname=gdeskcal
pkgver=1.01
pkgrel=1
pkgdesc="gDeskCal is a cute little eye-candy calendar for your desktop."
arch=(i686 x86_64)
license=('GPL')
url="http://www.pycage.de/#gdeskcal"
depends=('pygtk')
source=(http://www.pycage.de/download/gDeskCal-${pkgver}.tar.gz)
md5sums=('6198d3fb3b28eec6ec430564defda781')

build() {
  cd $startdir/src/gDeskCal-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var
  make || return 1 
  make DESTDIR=${startdir}/pkg install
}
