# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-crypt-random-seed
pkgver=0.03
pkgrel=7
pkgdesc='Provide strong randomness for seeding'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6.2' perl-crypt-random-tesha2)
url=https://metacpan.org/release/Crypt-Random-Seed
source=("https://cpan.metacpan.org/authors/id/D/DA/DANAJ/Crypt-Random-Seed-$pkgver.tar.gz")
md5sums=(9bc5a69a8f1964065da7823e19b98da2)
sha512sums=(5ee6ea67c325aa9693c96ef650e3888a599d3d7e25316f869808dc6e06b9dd86f1c200c9097939f74511e2ed59e48df1b28cc96e5f7988076d9f7f5d840a894e)
_ddir="Crypt-Random-Seed-$pkgver"

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
