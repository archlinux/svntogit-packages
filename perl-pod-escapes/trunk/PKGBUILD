# $Id$
# Maintainer: Kevin <kevin@archlinux.org>

pkgname=perl-pod-escapes
pkgver=1.04
pkgrel=3
pkgdesc="Module for resolving Pod E<...> sequences"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Pod-Escapes"
depends=('perl')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/S/SB/SBURKE/Pod-Escapes-${pkgver}.tar.gz)
md5sums=('00ea2e0d2e84ed98517a4616708b68d3')

build() {
  cd ${startdir}/src/Pod-Escapes-${pkgver}
  # Force module installation to "current" perl directories.
  eval `perl -V:archname`
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL \
      INSTALLARCHLIB=/usr/lib/perl5/current/${archname} \
      INSTALLSITELIB=/usr/lib/perl5/site_perl/current \
      INSTALLSITEARCH=/usr/lib/perl5/site_perl/current/${archname}
  make || return 1
  make install DESTDIR=${startdir}/pkg

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
# vim: ts=2 sw=2 et ft=sh
