# Maintainer: Florian Pritz <bluewind@xinu.at>
# Generator  : CPANPLUS::Dist::Arch 1.18

pkgname='perl-io-socket-inet6'
pkgver=2.73
pkgrel=2
pkgdesc="Object interface for AF_INET|AF_INET6 domain sockets"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-socket6>=0.12')
makedepends=()
url='https://search.cpan.org/dist/IO-Socket-INET6'
source=("https://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/IO-Socket-INET6-$pkgver.tar.gz")
md5sums=('f77a9173ea49d928530d6a2df33990f7')
sha512sums=('8d71b1fcb78b4338eb1973a2f9d1ccc539d6a6d83190b818df8ebcc43e978d7404eefedb51a7d6e0a64aa02375503325e8cd8723c7fec6dfdb277519b5a16b4b')
_distdir="IO-Socket-INET6-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor"     \
      PERL_MB_OPT="--installdirs vendor" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
