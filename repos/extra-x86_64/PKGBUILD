# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>

pkgname=perl-socket6
pkgver=0.29
pkgrel=7
pkgdesc="A getaddrinfo/getnameinfo support module"
arch=('x86_64')
url='https://search.cpan.org/dist/Socket6'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/U/UM/UMEMOTO/Socket6-$pkgver.tar.gz)
sha512sums=('51d05a04563519010f515a50fb1082c4e72eb4537137ad55f117458c71ec8429a5674083bd68adcbbf2e57632a1cb1bf60693ea98364e7f96c826ff8c9655b33')

build() {
  cd Socket6-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Socket6-$pkgver
  make test
}

package() {
  cd Socket6-$pkgver
  make DESTDIR="$pkgdir" install
}
