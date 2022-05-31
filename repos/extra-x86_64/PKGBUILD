# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Justin "juster" Davis <jrcd83@gmail.com>
# Generator : pbjam 0.01

pkgname=perl-list-moreutils-xs
pkgver=0.430
pkgrel=3
pkgdesc="Provide the stuff missing in List::Util"
url='https://search.cpan.org/dist/List-MoreUtils-XS'
arch=('x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
source=("https://search.cpan.org/CPAN/authors/id/R/RE/REHSACK/List-MoreUtils-XS-${pkgver}.tar.gz")
sha512sums=('98260b81f03a425bf8c2e0b63bc3a8d360a0aa2e198b2b7faaeaa48684936183018afdd1e6a04bd7e99a7e728d809709c6206ea578dfe7d8d40c5a4e3e4bb405')

build() {
  cd "${srcdir}/List-MoreUtils-XS-${pkgver}"
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/List-MoreUtils-XS-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/List-MoreUtils-XS-${pkgver}"
  make DESTDIR="$pkgdir" install
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
