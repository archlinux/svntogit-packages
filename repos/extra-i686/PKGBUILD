# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=perl-uri
_realname=URI
pkgver=1.35
pkgrel=3
pkgdesc="Perl Module: form Resource Identifiers (absolute and relative)"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://www.cpan.org/authors/id/G/GA/GAAS/${_realname}-$pkgver.tar.gz)
replaces=('uri')
provides=('uri')
md5sums=('1a933b1114c41a25587ee59ba8376f7c')

build() {
  cd $startdir/src/${_realname}-$pkgver
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make MAN1EXT=1p MAN3EXT=3pm  || return 1
  make install MAN1EXT=1p MAN3EXT=3pm DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
# vim: ts=2 sw=2 et ft=sh
