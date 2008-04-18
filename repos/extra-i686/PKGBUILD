# $Id$
# Maintainer: Kevin <kevin@archlinux.org>

pkgname=perl-test-pod
_realname=Test-Pod
pkgver=1.26
pkgrel=3
pkgdesc="Check for POD errors in files"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/${_realname}-${pkgver}.tar.gz)
md5sums=('2f259135656ac4549b65a4f14f07b7c6')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
# vim: ts=2 sw=2 et ft=sh
