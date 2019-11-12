# Maintainer:
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gawk
pkgver=5.0.1
pkgrel=2
pkgdesc="GNU version of awk"
arch=('x86_64')
url="https://www.gnu.org/software/gawk/"
license=('GPL')
groups=('base-devel')
depends=('sh' 'glibc' 'mpfr')
provides=('awk')
source=(https://ftp.gnu.org/pub/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.sig})
md5sums=('c5441c73cc451764055ee65e9a4292bb'
         'SKIP')
validpgpkeys=('D1967C63788713177D861ED7DF597815937EC0D2') # Arnold Robbins

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
