# $Id$
# Maintainer: Kevin <kevin@archlinux.org>

pkgname=perl-compress-raw-zlib
pkgver=2.006
pkgrel=1
pkgdesc="Low-Level Interface to zlib compression library"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Compress-Raw-Zlib"
depends=('perl')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/Compress-Raw-Zlib-${pkgver}.tar.gz)
md5sums=('5d3ea12c59ba3095327ed4d6f3d3538c')

build() {
  cd ${startdir}/src/Compress-Raw-Zlib-${pkgver}
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
