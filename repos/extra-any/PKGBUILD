# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=perl-archive-zip
pkgver=1.68
pkgrel=7
pkgdesc="Provide a perl interface to ZIP archive files"
arch=('any')
license=('GPL' 'PerlArtistic')
url="https://search.cpan.org/dist/Archive-Zip/"
depends=('perl')
checkdepends=('perl-test-mockmodule')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/P/PH/PHRED/Archive-Zip-${pkgver}.tar.gz)
sha512sums=('40c3ba26b1c27a8b15b919934e7fcd531f208bec73de3454e123ac1fb771831e287b8fade421be40e243498beb6dad9b6133ef07d2e5d407afbd1f3d6a30b916')

build() {
  cd Archive-Zip-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Archive-Zip-${pkgver}
  make test
}


package() {
  cd Archive-Zip-${pkgver}
  make DESTDIR="${pkgdir}" install
}
