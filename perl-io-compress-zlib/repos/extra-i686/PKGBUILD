# $Id$
# Maintainer: Kevin <kevin@archlinux.org>

pkgname=perl-io-compress-zlib
pkgver=2.006
pkgrel=1
pkgdesc="Write zlib files/buffers"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/IO-Compress-Zlib"
depends=('perl-compress-raw-zlib>=2.006' 'perl-io-compress-base>=2.006')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/IO-Compress-Zlib-${pkgver}.tar.gz)
md5sums=('9a3657de6b000a0531154063b2bb4443')

build() {
  cd ${startdir}/src/IO-Compress-Zlib-${pkgver}
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
