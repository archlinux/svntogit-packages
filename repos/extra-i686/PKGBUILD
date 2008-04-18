# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: K. Piche <kpiche@rogers.com>

pkgname=perl-date-calc
_realname=Date-Calc
pkgver=5.4
pkgrel=3
pkgdesc="Perl module for Gregorian calendar date calculations"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl-bit-vector' 'perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/S/ST/STBEY/${_realname}-${pkgver}.tar.gz)
md5sums=('7ae34972694127e8f1c9a2af1c24585b')

build() {
  cd $startdir/src/${_realname}-$pkgver
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
