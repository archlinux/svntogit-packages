# Maintainer:

pkgname=findutils
pkgver=4.6.0
pkgrel=2
pkgdesc="GNU utilities to locate files"
arch=('x86_64')
license=('GPL3')
groups=('base' 'base-devel')
depends=('glibc' 'sh')
url='https://www.gnu.org/software/findutils/'
source=("https://ftp.gnu.org/pub/gnu/findutils/${pkgname}-${pkgver}.tar.gz")
sha1sums=('f18e8aaee3f3d4173a1f598001003be8706d28b0')
#validpgpkeys=('A15B725964A95EE5') # James Youngman <james@youngman.org>

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Don't build or install locate because we use mlocate,
  # which is a secure version of locate.
  sed -i '/^SUBDIRS/s/locate//' Makefile.in

  ./configure --prefix=/usr
  # don't build locate, but the docs want a file in there.
  make -C locate dblocation.texi
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
}
