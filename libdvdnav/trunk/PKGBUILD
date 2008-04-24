# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# contributor Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=libdvdnav
pkgver=0.1.10
pkgrel=3
pkgdesc="The library for xine-dvdnav plugin."
arch=(i686 x86_64)
license=('GPL')
url="http://dvd.sourceforge.net/index.shtml"
depends=('glibc')
options=(!libtool)
source=(http://downloads.sourceforge.net/sourceforge/dvd/${pkgname}-${pkgver}.tar.gz)
md5sums=('c8ddee96ba1182d73447eaf0bb6fde81')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
