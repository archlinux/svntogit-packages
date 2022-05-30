# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=perl-timedate
pkgver=2.33
pkgrel=4
pkgdesc="Date formating subroutines"
arch=('any')
license=('PerlArtistic')
url="https://search.cpan.org/dist/TimeDate/"
depends=('perl')
replaces=('timedate')
provides=('timedate')
options=('!emptydirs')
source=("https://www.cpan.org/authors/id/A/AT/ATOOMIC/TimeDate-$pkgver.tar.gz")
sha512sums=('a3a20a0d9439e68bf621c66fad0598e6257345727be79c87c7cc99994b3a58eb738787fedb720beb069e9758ad1347c15313f64411806dd0f4dfbcca5061c820')

build() {
  cd TimeDate-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd TimeDate-$pkgver
  make test
}

package() {
  cd TimeDate-$pkgver
  make install DESTDIR="$pkgdir"
}
