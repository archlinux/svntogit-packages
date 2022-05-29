# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-mailtools
pkgver=2.21
pkgrel=6
pkgdesc="Various e-mail related modules"
arch=('any')
url="https://metacpan.org/release/MailTools"
license=('PerlArtistic' 'GPL')
depends=('perl-timedate')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/MailTools-$pkgver.tar.gz")
sha512sums=('70c7e5760691a1fc0a2812c48a632896db9bf719d3cb07a63c3a4456c5a365855c7f71c7436c84e5085374628f26ad31fcf13e74b3b7242911da59b7916065a0')

build() {
  cd MailTools-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd MailTools-$pkgver
  make test
}

package() {
  cd MailTools-$pkgver
  make DESTDIR="$pkgdir" install
}
