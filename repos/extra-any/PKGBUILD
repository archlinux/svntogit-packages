# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-error
pkgver=0.17029
pkgrel=4
pkgdesc="Perl/CPAN Error module - Error/exception handling in an OO-ish way"
url="https://search.cpan.org/dist/Error/"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Error-${pkgver}.tar.gz)
sha512sums=('266ba1feff897c1d162e69a83e595cb40da9a6e1d8b10cc5531626eff392c6da94be03ba722c74827fc2ea0d9d1c1e62e824d9021e098b700db65dd0b3acbd0a')

build() {
  cd Error-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make 
}

check() {
  cd Error-${pkgver}
  make test
}

package() {
  cd Error-${pkgver}
  make DESTDIR="${pkgdir}" install
}
