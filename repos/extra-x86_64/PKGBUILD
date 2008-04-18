# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Charles Mauch <cmauch@gmail.com>

pkgname=perl-yaml
_realname=YAML
pkgver=0.66
pkgrel=1
pkgdesc="Perl/CPAN Module YAML : YAML Aint Markup Language tm"
arch=(i686 x86_64)
url="http://search.cpan.org/dist/${_realname}/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://www.cpan.org/authors/id/I/IN/INGY/${_realname}-${pkgver}.tar.gz)
md5sums=('33a0367cb343e1f0dce20f144d0167ba')

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
