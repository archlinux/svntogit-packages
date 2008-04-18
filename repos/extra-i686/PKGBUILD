# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=perl-html-parser
_realname=HTML-Parser
pkgver=3.56
pkgrel=3
pkgdesc="Perl HTML parser class"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl-html-tagset' 'perl>=5.10.0')
options=(!emptydirs)
replaces=('html-parser')
provides=('html-parser')
source=(http://www.cpan.org/authors/id/G/GA/GAAS/${_realname}-${pkgver}.tar.gz)
md5sums=('bddc432e5ed9df4d4153a62234f04fc2')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make MAN1EXT=1p MAN3EXT=3pm  || return 1
  make install MAN1EXT=1p MAN3EXT=3pm DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
# vim: ts=2 sw=2 et ft=sh
