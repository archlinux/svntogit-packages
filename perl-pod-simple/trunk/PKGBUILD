# $Id$
# Maintainer: Kevin <kevin@archlinux.org>
# Contributor: Ivan Bobrov <ibobrik@gmail.com>

pkgname=perl-pod-simple
_realname=Pod-Simple
pkgver=3.05
pkgrel=2
pkgdesc="Framework for parsing Pod"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~arandal/${_realname}"
depends=('perl-pod-escapes')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/A/AR/ARANDAL/${_realname}-${pkgver}.tar.gz)
md5sums=('be3f9e5d685ff38a3f0be66322d68cef')

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
