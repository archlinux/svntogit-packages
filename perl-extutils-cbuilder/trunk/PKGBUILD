# $Id$
# Maintainer: Kevin <kevin@archlinux.org>
# Contributor: pippin <?@?>

pkgname=perl-extutils-cbuilder
pkgver=0.19
pkgrel=2
pkgdesc="Compile and link C code for Perl modules"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/ExtUtils-CBuilder"
depends=('perl')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/K/KW/KWILLIAMS/ExtUtils-CBuilder-${pkgver}.tar.gz)
md5sums=('65cea2b1f960236092788002d7c5c477')

build() {
  cd ${startdir}/src/ExtUtils-CBuilder-${pkgver}
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
