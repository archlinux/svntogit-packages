# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=perl-version
pkgver=0.7203
pkgrel=2
pkgdesc="Perl extension for Version Objects."
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
depends=('perl')
options=(!emptydirs)
url="http://search.cpan.org/dist/version/"
source=(http://search.cpan.org/CPAN/authors/id/J/JP/JPEACOCK/version-$pkgver.tar.gz)
md5sums=('796053989cb6e3ca3fb0c5b4e92cf109')

build() {
  cd $startdir/src/version-$pkgver
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
