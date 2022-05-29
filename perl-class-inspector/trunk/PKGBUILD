# Maintainer:

pkgname=perl-class-inspector
pkgver=1.36
pkgrel=5
pkgdesc="Get information about a class and its structure"
arch=('any')
url="https://search.cpan.org/dist/Class-Inspector"
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/P/PL/PLICEASE/Class-Inspector-${pkgver}.tar.gz")
sha512sums=('488fcdbc9d135ed833331b0d5feb452997f35400b185341be69996438c278961eeb543648a629940765e779ca5cc87c5c3aa2c61a7fac12d2ecf6c599b68715a')

build() {
  cd Class-Inspector-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Class-Inspector-${pkgver}
  make test
}

package() {
  cd Class-Inspector-${pkgver}
  make DESTDIR="$pkgdir" install
}
