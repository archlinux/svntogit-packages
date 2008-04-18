# $Id$
# Maintainer: Daniel Isenmann <daniel [at] archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>
pkgname=gc
pkgver=7.0
pkgrel=2
pkgdesc="A garbage collector for C and C++"
arch=(i686 x86_64)
url="http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
source=(http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/${pkgname}-${pkgver}.tar.gz)
depends=(gcc-libs)
options=(!libtool)
md5sums=('3645ccf5f32ebb27d99b27b0d29e9c38')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-cplusplus
  make || return 1
  make DESTDIR=${startdir}/pkg install

  #Documentation, delete it but keep the manpage
  install -d -m755 ${startdir}/pkg/usr/man/man3
  install -m644 ${startdir}/pkg/usr/share/gc/gc.man ${startdir}/pkg/usr/man/man3/gc.3
  rm -rf ${startdir}/pkg/usr/share/
}
