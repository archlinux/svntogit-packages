# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=gettext
pkgver=0.17
pkgrel=1
pkgdesc="GNU internationalization library"
arch=(i686 x86_64)
url="http://www.gnu.org/software/gettext"
license=('GPL')
groups=('base')
depends=('gcc-libs' 'acl')
options=(!libtool)
source=(ftp://ftp.gnu.org/pub/gnu/gettext/${pkgname}-${pkgver}.tar.gz)
md5sums=('58a2bc6d39c0ba57823034d55d65d606')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  sed -i -e 's/libexpat.so.0/libexpat.so.1/' gettext-tools/src/x-glade.c
  ./configure --prefix=/usr --enable-csharp
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
