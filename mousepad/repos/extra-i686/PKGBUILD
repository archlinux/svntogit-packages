# $Id$
# Maintainer: tobias [tobias at archlinux.org]

pkgname=mousepad
pkgver=0.2.13
pkgrel=1
pkgdesc="Simple Text Editor for Xfce4 (based on Gedit)" 
arch=(i686 x86_64)
groups=('xfce4') 
license="GPL2" 
depends=('libxfcegui4>=4.4.2')
makedepends=('pkgconfig' 'xfce-mcs-manager')
options=('!libtool')
url=('http://www.xfce.org/~benny/apps.html')
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-4.4.2/src/${pkgname}-${pkgver}.tar.bz2)
md5sums=('326075ac933e5da38cedbc20e80b7026')

build() { 
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
