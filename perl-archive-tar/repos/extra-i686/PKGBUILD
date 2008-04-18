# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>

pkgname=perl-archive-tar
pkgver=1.34
pkgrel=1
pkgdesc="Perl module for manipulations of tar archives"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Archive-Tar/"
depends=('perl-io-zlib')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/K/KA/KANE/Archive-Tar-${pkgver}.tar.gz)
md5sums=('0abdbc5ace1cc5696faeb7e9a058dad2')

build() {
  cd ${startdir}/src/Archive-Tar-${pkgver}
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
