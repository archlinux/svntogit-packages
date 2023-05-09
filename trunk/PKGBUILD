# Maintainer:
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gawk
pkgver=5.2.2
pkgrel=1
pkgdesc="GNU version of awk"
arch=('x86_64')
url="https://www.gnu.org/software/gawk/"
license=('GPL')
depends=('sh' 'glibc' 'mpfr')
provides=('awk')
source=(https://ftp.gnu.org/pub/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.sig})
validpgpkeys=('D1967C63788713177D861ED7DF597815937EC0D2') # Arnold Robbins
sha256sums=('945aef7ccff101f20b22a10802bc005e994ab2b8ea3e724cc1a197c62f41f650'
            'SKIP')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc --without-libsigsegv
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
