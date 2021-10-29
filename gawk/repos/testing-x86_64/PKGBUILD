# Maintainer:
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gawk
pkgver=5.1.1
pkgrel=1
pkgdesc="GNU version of awk"
arch=('x86_64')
url="https://www.gnu.org/software/gawk/"
license=('GPL')
groups=('base-devel')
depends=('sh' 'glibc' 'mpfr')
provides=('awk')
source=(https://ftp.gnu.org/pub/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.sig})
validpgpkeys=('D1967C63788713177D861ED7DF597815937EC0D2') # Arnold Robbins
md5sums=('f4aa3fe2dd802cc625c5120a6148e91b'
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
