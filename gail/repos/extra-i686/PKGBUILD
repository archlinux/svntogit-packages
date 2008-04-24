# $Id$
# Maintainer: Jan de Groot <jan@archlinux.org>

pkgname=gail
pkgver=1.22.1
pkgrel=1
pkgdesc="The GNOME Accessibility Project"
arch=(i686 x86_64)
license=('GPL')
depends=('gtk2>=2.12.9')
makedepends=('pkgconfig')
options=('!libtool')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/1.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('521e2e1ae1dfe4699c037b1be205b0b3')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
