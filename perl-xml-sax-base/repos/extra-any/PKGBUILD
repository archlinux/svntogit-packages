# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Hunt <lazy at brandnewmath dot com>

pkgname=perl-xml-sax-base
pkgver=1.09
pkgrel=5
pkgdesc="Base class SAX Drivers and Filters"
arch=('any')
url="https://search.cpan.org/dist/XML-SAX-Base"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("https://www.cpan.org/authors/id/G/GR/GRANTM/XML-SAX-Base-$pkgver.tar.gz")
sha256sums=('66cb355ba4ef47c10ca738bd35999723644386ac853abbeb5132841f5e8a2ad0')

build() {
  cd XML-SAX-Base-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd XML-SAX-Base-$pkgver
  make test
}

package() {
  cd XML-SAX-Base-$pkgver
  make install DESTDIR="$pkgdir"

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
