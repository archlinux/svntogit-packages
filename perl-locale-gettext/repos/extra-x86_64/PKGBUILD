# $Id$
# Contributor: Mark Rosenstand <mark@borkware.net>
# Maintainer: Paul Mattal <paul@archlinux.org>

pkgname=perl-locale-gettext
_realname=gettext
pkgver=1.05
pkgrel=3
pkgdesc="Permits access from Perl to the gettext() family of functions."
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('gettext' 'perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/P/PV/PVANDRY/${_realname}-${pkgver}.tar.gz)
md5sums=('f3d3f474a1458f37174c410dfef61a46')

build() {
  cd ${startdir}/src/${_realname}-${pkgver} || return 1
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make MAN1EXT=1p MAN3EXT=3pm  || return 1
  make install MAN1EXT=1p MAN3EXT=3pm DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
