# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-crypt-openssl-guess
pkgver=0.15
pkgrel=2
pkgdesc='Guess OpenSSL include path'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.8.1')
makedepends=('perl-extutils-makemaker>=6.64')
url=https://metacpan.org/release/Crypt-OpenSSL-Guess
source=("https://cpan.metacpan.org/authors/id/A/AK/AKIYM/Crypt-OpenSSL-Guess-$pkgver.tar.gz")
md5sums=(e07f470dd25023730cf8536e0cefbabd)
sha512sums=(d7527be1f07847fbafc10b30c00c43e7fdcd4db27535b16cac98c5b6507d138c14cebcdb3c4ef07dc3016a93fea95155548cc7d83a0309fbc13b7d3b9607bf5d)
_ddir="Crypt-OpenSSL-Guess-$pkgver"

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
