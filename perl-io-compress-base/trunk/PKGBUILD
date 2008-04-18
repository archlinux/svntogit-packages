# $Id$
# Maintainer: Kevin <kevin@archlinux.org>

pkgname=perl-io-compress-base
pkgver=2.006
pkgrel=1
pkgdesc="Base Class for IO::Compress modules"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/IO-Compress-Base"
depends=('perl')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/IO-Compress-Base-${pkgver}.tar.gz)
md5sums=('27db010114039a3b63b512d28218b8cb')

build() {
  cd ${startdir}/src/IO-Compress-Base-${pkgver}
  # Force module installation to "current" perl directories.
  eval `perl -V:archname`
  perl Makefile.PL \
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
