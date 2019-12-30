# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-xml-sax
pkgver=1.02
pkgrel=1
pkgdesc="Simple API for XML"
arch=('any')
url="https://search.cpan.org/dist/XML-SAX"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-xml-sax-base' 'perl-xml-namespacesupport')
options=('!emptydirs')
install=perl-xml-sax.install
source=("https://www.cpan.org/authors/id/G/GR/GRANTM/XML-SAX-$pkgver.tar.gz") 
sha512sums=('bb30ddbbcf27803825d2f0936257e102999a197cb14bd77fa8b7a469f3a24fb7d861ef4eb03230e5581e4ed88beb8676cbb907b2cb63e9ef1a64b2c211ebdc5a')

build() {
  cd XML-SAX-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd XML-SAX-$pkgver
  make test
}

package() {
  cd XML-SAX-$pkgver
  PERLLIB=blib/lib make install DESTDIR="$pkgdir"

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
