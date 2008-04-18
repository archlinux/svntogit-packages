# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>

pkgname=perl-io-zlib
pkgver=1.07
pkgrel=1
pkgdesc="Perl module for IO:: Style Interface to Compress::Zlib"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/IO-Zlib"
depends=('perl-compress-zlib')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/T/TO/TOMHUGHES/IO-Zlib-${pkgver}.tar.gz)
md5sums=('06aa91c973aac0985e439ab8660e687f')

build() {
  cd ${startdir}/src/IO-Zlib-${pkgver}
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
