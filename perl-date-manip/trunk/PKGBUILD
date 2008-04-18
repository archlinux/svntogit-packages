# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=perl-date-manip
_realname=Date-Manip
pkgver=5.48
pkgrel=1
pkgdesc="Date::Manip - date manipulation routines"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/S/SB/SBECK/${_realname}-${pkgver}.tar.gz)
md5sums=('961ba2cd3b00ea82f77e1fba10036c79')

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
