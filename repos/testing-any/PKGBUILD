# Maintainer:

pkgname=perl-http-cookies
pkgver=6.10
pkgrel=3
pkgdesc="HTTP cookie jars"
arch=('any')
url="https://search.cpan.org/dist/HTTP-Cookies"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-http-date' 'perl-http-message')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/HTTP-Cookies-$pkgver.tar.gz)
sha512sums=('c24a986e524ebf5d8b13b4580c3ee6aed018e79c203fd62208bfe970744482832fe9c41bb3195a596af1e11058053ed7615a09a26fbcef4433e270f0f5d38658')

build() {
  cd HTTP-Cookies-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd HTTP-Cookies-$pkgver
  make test
}

package() {
  cd HTTP-Cookies-$pkgver
  make DESTDIR="$pkgdir" install
}
