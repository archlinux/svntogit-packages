# $Id$
# Maintainer: Jan de Groot
# Contributor: Charles Mauch <cmauch@gmail.com>

pkgname=perl-mime-types
_realname=MIME-Types
pkgver=1.23
pkgrel=1
pkgdesc="Perl/CPAN Module MIME::Types : Information and processing MIME types"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
makedepends=('perl-test-pod')
options=(!emptydirs)
source=(http://www.cpan.org/authors/id/M/MA/MARKOV/${_realname}-${pkgver}.tar.gz)
md5sums=('57c842f00324f6c103fb5302b0c36bfc')

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
