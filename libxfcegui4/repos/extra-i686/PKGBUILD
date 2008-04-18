# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>

pkgname=libxfcegui4
pkgver=4.4.2
pkgrel=1
pkgdesc="Various gtk widgets for Xfce"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=('startup-notification' 'gtk2>=2.12.1' 'libxfce4util>=4.4.2')
makedepends=('dbh' 'pkgconfig')
options=('!libtool')
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/${pkgname}-${pkgver}.tar.bz2)
md5sums=('799a4869138c605126e8e71d58189bfd')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static \
    --enable-xinerama
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
