# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor:  Matt Thompson <mattt@defunct.ca>
pkgname=perl-dbi
_realname=DBI
pkgver=1.601
pkgrel=1
pkgdesc="Database independent interface for Perl"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://www.cpan.org/authors/id/T/TI/TIMB/${_realname}-${pkgver}.tar.gz)
md5sums=('d80677bd8113ec8cb0438b8703f3c418')

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
