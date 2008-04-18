# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Eric Johnson <eric@coding-zone.com>

pkgname=perl-dbd-mysql
_realname=DBD-mysql
pkgver=4.006
pkgrel=1
pkgdesc="Perl/CPAN DBD::mysql module for interacting with MySQL via DBD"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('libmysqlclient' 'perl-dbi' 'perl>=5.10.0')
makedepends=('mysql')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/C/CA/CAPTTOFU/${_realname}-${pkgver}.tar.gz)
md5sums=('133ac08c22bb19194ad8b895e3204310')

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
