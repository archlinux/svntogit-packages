# Maintainer:

pkgname=perl-file-listing
pkgver=6.15
pkgrel=2
pkgdesc="parse directory listing"
arch=('any')
url="https://search.cpan.org/dist/File-Listing"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-http-date')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/P/PL/PLICEASE/File-Listing-${pkgver}.tar.gz")
sha512sums=('8368605bf196750f4044d87a8b784e6a28fa6fe6d5971c5de507b4df77859020dcba4929ce97f5091966a6a2fca94466a345450f2f9d2fad9fb88d880f491944')

build() {
  cd File-Listing-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd File-Listing-${pkgver}
  make test
}

package() {
  cd File-Listing-${pkgver}
  make DESTDIR="$pkgdir" install
}
