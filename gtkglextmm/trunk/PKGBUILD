# $Id$
# Maintainer: tobias@archlinux.org

pkgname=gtkglextmm
pkgver=1.2.0
pkgrel=1
pkgdesc="Cpp C++ bindings for gtkglext"
arch=(i686 x86_64)
url="http://gtkglext.sourceforge.net/"
depends=('gtkmm>=2.10.1')
makedepends=('gtkglext')
options=('NOLIBTOOL')
license="GPL"
source=(http://dl.sourceforge.net/gtkglext/${pkgname}-${pkgver}.tar.bz2)
md5sums=('27c05f4d45c5fd07b6fb0f044add3056')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr    
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
