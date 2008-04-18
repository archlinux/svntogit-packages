# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>
pkgname=libxfce4util
pkgver=4.4.2
pkgrel=1
pkgdesc="Basic utility non-GUI functions for Xfce"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=('glib2>=2.6.0')
makedepends=('pkgconfig')
options=('!libtool')
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/${pkgname}-${pkgver}.tar.bz2)
md5sums=('261e7a5df039493ad746e0c359211092')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm -rf ${startdir}/pkg/usr/share/gtk-doc
}
