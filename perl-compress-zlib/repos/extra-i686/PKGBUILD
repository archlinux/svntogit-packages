# $Id$
# Maintainer: Kevin <kevin@archlinux.org>
# Contributor: Eric Johnson <eric@coding-zone.com>

pkgname=perl-compress-zlib
_realname=Compress-Zlib
pkgver=2.006
pkgrel=1
pkgdesc="Perl module for Zlib compression"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~pmqs/${_realname}"
depends=("perl-compress-raw-zlib>=${pkgver}" "perl-io-compress-zlib>=${pkgver}")
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/${_realname}-${pkgver}.tar.gz)
md5sums=('9743b7cafb21e2e0aa16fd0e4d62e526')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
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
