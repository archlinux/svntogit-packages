# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Justin "juster" Davis <jrcd83@gmail.com>
# Generator : pbjam 0.01

pkgname=perl-list-moreutils
pkgver=0.430
pkgrel=3
pkgdesc="Provide the stuff missing in List::Util"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exporter-tiny' 'perl-list-moreutils-xs')
url=https://search.cpan.org/dist/List-MoreUtils
source=("https://search.cpan.org/CPAN/authors/id/R/RE/REHSACK/List-MoreUtils-${pkgver}.tar.gz")
sha512sums=('bc9ff033c12251a6f0899a96da0ec8fc314ddb8d6cdf18c37fe1fdcfc38a4c95ed6f8e006bb124e77d07241ae6754f429bc2041f7772b4acfce9378a21283469')

build() {
  cd "${srcdir}/List-MoreUtils-${pkgver}"
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/List-MoreUtils-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/List-MoreUtils-${pkgver}"
  make DESTDIR="$pkgdir" install
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
