# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-common-sense
pkgver=3.75
pkgrel=4
pkgdesc="Implements some sane defaults for Perl programs"
arch=('any')
url="https://search.cpan.org/dist/common-sense"
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/common-sense-$pkgver.tar.gz")
sha512sums=('cb6034d9ff721a4122e0215db8ad5279ec4b189c3364593d427d70a1e84a1583a0e1447e276aa9a4fcaeb2f9d47a465a5bc4c0f842c803d3ddf91755311f4af4')

build() {
  cd common-sense-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd common-sense-$pkgver
  make test
}

package() {
  cd common-sense-$pkgver
  make DESTDIR="$pkgdir" install
}
