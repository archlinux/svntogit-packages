# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Charles Mauch <cmauch@gmail.com>

pkgname=perl-yaml
pkgver=1.30
pkgrel=4
pkgdesc="Perl/CPAN Module YAML : YAML Aint Markup Language"
arch=('any')
url="https://search.cpan.org/dist/YAML/"
license=('GPL' 'PerlArtistic')
depends=('perl')
checkdepends=('perl-test-deep' 'perl-test-yaml')
options=('!emptydirs')
source=(https://www.cpan.org/authors/id/T/TI/TINITA/YAML-${pkgver}.tar.gz)
sha512sums=('f73f2d9f3cd96edeb05ec098c859755dd6b80bf1a00049f8de2889ebbf4f41df9fcc1540116afa8648e965a0b780d993f256af2c5ffc03a9f1ba7df1f0cc8941')

build() {
  cd YAML-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd YAML-${pkgver}
  make test
}

package() {
  cd YAML-${pkgver}
  make DESTDIR="${pkgdir}" install
}
