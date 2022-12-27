# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-math-round
pkgver=0.07
pkgrel=5
pkgdesc="Perl extension for rounding numbers"
arch=('any')
url="https://search.cpan.org/dist/Math-Round"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("https://www.cpan.org/authors/id/G/GR/GROMMEL/Math-Round-$pkgver.tar.gz")
sha256sums=('73a7329a86e54a5c29a440382e5803095b58f33129e61a1df0093b4824de9327')

build() {
  cd  "${srcdir}/Math-Round-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd  "${srcdir}/Math-Round-${pkgver}"
  make test
}

package() {
  cd  "${srcdir}/Math-Round-${pkgver}"
  make install DESTDIR="${pkgdir}"

  find "${pkgdir}" -name '.packlist' -delete
  find "${pkgdir}" -name '*.pod' -delete
}
