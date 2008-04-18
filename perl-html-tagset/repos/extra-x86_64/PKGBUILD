# $Id$
# Maintainer: kevin <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=perl-html-tagset
_realname=HTML-Tagset
pkgver=3.10
pkgrel=3
pkgdesc="Data tables useful in parsing HTML"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
replaces=('html-tagset')
provides=('html-tagset')
options=(!emptydirs)
source=(http://www.cpan.org/authors/id/P/PE/PETDANCE/${_realname}-${pkgver}.tar.gz)
md5sums=('89bdd351272ccd285fa61c5b2ce451ab')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make MAN1EXT=1p MAN3EXT=3pm  || return 1
  make install MAN1EXT=1p MAN3EXT=3pm DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
# vim: ts=2 sw=2 et ft=sh
