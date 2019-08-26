# Maintainer:
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gawk
pkgver=5.0.1
pkgrel=1
pkgdesc="GNU version of awk"
arch=('x86_64')
url="https://www.gnu.org/software/gawk/"
license=('GPL')
groups=('base' 'base-devel')
depends=('sh' 'glibc' 'mpfr')
provides=('awk')
source=(https://ftp.gnu.org/pub/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.sig})
md5sums=('c5441c73cc451764055ee65e9a4292bb'
         'SKIP')
validpgpkeys=('D1967C63788713177D861ED7DF597815937EC0D2') # Arnold Robbins

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc --without-libsigsegv
  make
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  #install -dm755 ${pkgdir}/bin
  #ln -sf /usr/bin/gawk ${pkgdir}/bin/
  #ln -sf gawk ${pkgdir}/bin/awk
}
