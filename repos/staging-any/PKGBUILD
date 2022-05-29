# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-fcgi-client
pkgver=0.09
pkgrel=2
pkgdesc='client library for fastcgi protocol'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.8.1' 'perl-moo>=2' perl-type-tiny)
makedepends=('perl-module-build-tiny>=0.035')
url=https://metacpan.org/release/FCGI-Client
source=("https://cpan.metacpan.org/authors/id/T/TO/TOKUHIROM/FCGI-Client-$pkgver.tar.gz")
md5sums=(d3e621b79a96ea1463331e33cf337524)
sha512sums=(962166f10cd79f99a67a94002b4cff7324fced3aca6448cd485d07c489e6fbb25a090b964622aa178a20c8f930f916c5aac10525392ace45cfcb908733675079)
_ddir="FCGI-Client-$pkgver"

build()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  unset PERL5LIB PERL_MB_OPT
  /usr/bin/perl Build.PL
  ./Build
)

check()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  unset PERL5LIB PERL_MB_OPT
  ./Build test
)

package()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  unset PERL5LIB PERL_MB_OPT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
