# $Id$
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=xarchiver
pkgver=0.4.6
pkgrel=6
pkgdesc="a GUI for multiple archive types"
arch=(i686 x86_64)
license=('GPL2')
groups=('xfce4-goodies')
url="http://xarchiver.xfce.org"
depends=('gtk2')
makedepends=('intltool' 'pkgconfig')
options=('!libtool')
install=${pkgname}.install
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('9700305deef4e2b6878697bd18bd2dd9')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
