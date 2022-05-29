# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-dbi
pkgver=1.643
pkgrel=4
pkgdesc="Database independent interface for Perl"
arch=('x86_64')
url="http://search.cpan.org/dist/DBI/"
license=('GPL' 'PerlArtistic')
depends=('perl')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
options=('!emptydirs')
source=("https://www.cpan.org/authors/id/T/TI/TIMB/DBI-$pkgver.tar.gz")
sha512sums=('03812f3eb1e43c8290dadb8cb14bbced9ec6e237228ea2a2ba91f22e52143906a91a7e82945dab30b1d1b9fc925073721111adafd9a09fac070808ab88f908b8')

build() {
  cd DBI-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd DBI-$pkgver
  make test
}

package() {
  cd DBI-$pkgver
  make DESTDIR="$pkgdir" install
}
