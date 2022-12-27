# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: kevin <kevin@archlinux.org>

pkgname=perl-string-shellquote
_realname=String-ShellQuote
pkgver=1.04
pkgrel=7
pkgdesc="Quote strings for passing through the shell"
arch=('any')
license=('GPL')
url="https://search.cpan.org/dist/${_realname}/"
depends=('perl')
replaces=('string-shellquote')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/$_realname-$pkgver.tar.gz")
sha256sums=('e606365038ce20d646d255c805effdd32f86475f18d43ca75455b00e4d86dd35')

build() {
  cd ${_realname}-${pkgver}
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd ${_realname}-${pkgver}
  make test
}

package() {
  cd ${_realname}-${pkgver}
  make install DESTDIR="${pkgdir}"

  # remove perllocal.pod and .packlist
  find "${pkgdir}" -name perllocal.pod -delete
  find "${pkgdir}" -name .packlist -delete
}
