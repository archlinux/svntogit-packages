# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-try-tiny
pkgver=0.31
pkgrel=2
pkgdesc="Minimal try/catch with proper localization of \$@"
arch=('any')
url="https://search.cpan.org/dist/Try-Tiny"
license=('MIT')
depends=('perl')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Try-Tiny-${pkgver}.tar.gz")
sha512sums=('1a3c852e56797d81da60a4f4887cb70fc575eca83d10b8cd12fe5d5d0008a967801218f3a5277a2f1347ade95b9515c1f237333e491742d06614c0beecf44768')

build() {
  cd Try-Tiny-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Try-Tiny-${pkgver}
  make test
}

package() {
  cd Try-Tiny-${pkgver}
  make DESTDIR="$pkgdir" install
  # upstream typo :/
  install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
