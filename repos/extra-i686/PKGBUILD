# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: K. Piche <kpiche@rogers.com>

pkgname=perl-carp-clan
_realname=Carp-Clan
pkgver=5.10
pkgrel=1
pkgdesc='Perl/CPAN Carp::Clan module - Report errors from perspective of caller of a "clan" of modules'
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/J/JJ/JJORE/${_realname}-${pkgver}.tar.gz)
md5sums=('64bd76295ab55e8a60741483f08b311c')

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
