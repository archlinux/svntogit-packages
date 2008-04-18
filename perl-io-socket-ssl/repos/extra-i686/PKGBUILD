# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=perl-io-socket-ssl
_realname=IO-Socket-SSL
pkgver=1.12
pkgrel=1
pkgdesc="IO::Socket::SSL - Nearly transparent SSL encapsulation for IO::Socket::INET"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl-net-ssleay' 'perl>=5.10.0')
options=(!emptydirs)
replaces=('io-socket-ssl')
provides=('io-socket-ssl')
source=(http://www.cpan.org/authors/id/S/SU/SULLR/${_realname}-${pkgver}.tar.gz)
md5sums=('0f6e80c15341094df16828a25dbaeeaa')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
# vim: ts=2 sw=2 et ft=sh
