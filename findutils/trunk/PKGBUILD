# Maintainer:

pkgname=findutils
pkgver=4.7.0
pkgrel=2
pkgdesc="GNU utilities to locate files"
arch=('x86_64')
license=('GPL3')
groups=('base-devel')
depends=('glibc' 'sh')
url='https://www.gnu.org/software/findutils/'
source=("https://ftp.gnu.org/pub/gnu/findutils/${pkgname}-${pkgver}.tar.xz"{,.sig})
sha1sums=('bd2fae4add80334173e03272aeed5635d4a0fa03'
          'SKIP')
validpgpkeys=('A5189DB69C1164D33002936646502EF796917195') # Bernhard Voelker <mail@bernhard-voelker.de>

build() {
  cd ${pkgname}-${pkgver}

  # Don't build or install locate because we use mlocate,
  # which is a secure version of locate.
  sed -e '/^SUBDIRS/s/locate//' -e 's/frcode locate updatedb//' -i Makefile.in

  ./configure --prefix=/usr
  # don't build locate, but the docs want a file in there.
  make -C locate dblocation.texi
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
