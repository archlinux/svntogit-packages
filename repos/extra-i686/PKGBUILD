# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=libidl2
pkgver=0.8.10
pkgrel=1
pkgdesc="A front-end for CORBA 2.2 IDL and Netscape's XPIDL"
arch=(i686 x86_64)
license=('LGPL')
depends=('glib2>=2.14.1')
makedepends=('pkgconfig')
options=('!libtool' '!emptydirs')
source=(http://ftp.gnome.org/pub/gnome/sources/libIDL/0.8/libIDL-${pkgver}.tar.bz2)
url="http://www.gnome.org"
md5sums=('9e10a77ff225587e59c0a28c66b4faa7')

build() {
  cd ${startdir}/src/libIDL-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
