# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=perl-error
_realname=Error
pkgver=0.17011
pkgrel=1
pkgdesc="Perl/CPAN Error module - Error/exception handling in an OO-ish way"
url="http://search.cpan.org/dist/${_realname}/"
arch=(i686 x86_64)
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.0')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/${_realname}-${pkgver}.tar.gz)
md5sums=('64cbb2e27481ea8a2fce4a033eabc956')

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
