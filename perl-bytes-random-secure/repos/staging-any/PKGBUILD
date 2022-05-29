# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-bytes-random-secure
pkgver=0.29
pkgrel=10
pkgdesc='Perl extension to generate cryptographically-secure random bytes.'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6.0' perl-crypt-random-seed perl-math-random-isaac)
url=https://metacpan.org/release/Bytes-Random-Secure
source=("https://cpan.metacpan.org/authors/id/D/DA/DAVIDO/Bytes-Random-Secure-$pkgver.tar.gz")
md5sums=(53d95b7efc5962fe41835c7ab0f83475)
sha512sums=(72faf9e9fff1cc9641845d47b8dd1efb39861b4015246b169167d4f6050998e91d30b53d6a3e08daf91a838fcf29a05042073064204270de05b2f2ca9990fe64)
_ddir="Bytes-Random-Secure-$pkgver"

build()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  unset PERL5LIB PERL_MM_OPT
  /usr/bin/perl Makefile.PL
  make
)

check()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1
  unset PERL5LIB
  make test
)

package()
(
  cd "$srcdir/$_ddir"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
