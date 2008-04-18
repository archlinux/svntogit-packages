# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=perl-digest-sha1
_realname=Digest-SHA1
pkgver=2.11
pkgrel=3
pkgdesc="Perl Module: Interface to the SHA-1 Algorithm."
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://www.cpan.org/authors/id/G/GA/GAAS/${_realname}-${pkgver}.tar.gz)
replaces=('digest-sha1')
provides=('digest-sha1')
md5sums=('2449bfe21d6589c96eebf94dae24df6b')

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
