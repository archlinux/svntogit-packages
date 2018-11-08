# Maintainer:

pkgname=findutils
pkgver=4.6.0
pkgrel=4
pkgdesc="GNU utilities to locate files"
arch=('x86_64')
license=('GPL3')
groups=('base' 'base-devel')
depends=('glibc' 'sh')
url='https://www.gnu.org/software/findutils/'
source=("https://ftp.gnu.org/pub/gnu/findutils/${pkgname}-${pkgver}.tar.gz"
        "gnulib-fflush.patch"
        "gnulib-makedev.patch")
sha1sums=('f18e8aaee3f3d4173a1f598001003be8706d28b0'
          '1bc1586f6a52083939c4cabc32f12e7aead97e61'
          '051382a2b0039438c2b143f2f9e5dc4bea130a09')
#validpgpkeys=('A15B725964A95EE5') # James Youngman <james@youngman.org>  - NOTE: PGP-2 key

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "$srcdir"/gnulib-fflush.patch
  patch -p1 -i "$srcdir"/gnulib-makedev.patch
}

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
