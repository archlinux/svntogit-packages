# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=perl-digest-hmac
_realname=Digest-HMAC
pkgver=1.04
pkgrel=3
pkgdesc="Perl Module: Keyed-Hashing for Message Authentication."
arch=('any')
license=('PerlArtistic')
url="https://search.cpan.org/dist/Digest-HMAC/"
depends=('perl-digest-sha1' 'perl')
options=(!emptydirs)
source=("https://www.cpan.org/authors/id/A/AR/ARODLAND/Digest-HMAC-$pkgver.tar.gz")
sha512sums=('d30b62e60bfa9f6c0f0c058e190938f13a08a70a816771a0641226c24045cb6dbd622756f1f88593fd3690442a45636bdcaf35457e9dfea6de5f8a342a538a6d')

build() {
  cd Digest-HMAC-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Digest-HMAC-$pkgver
  make test
}

package() {
  cd Digest-HMAC-$pkgver
  make install DESTDIR="$pkgdir"
}

# vim: ts=2 sw=2 et ft=sh
