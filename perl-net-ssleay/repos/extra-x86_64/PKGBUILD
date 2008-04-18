# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=perl-net-ssleay
_realname=Net_SSLeay.pm
pkgver=1.30
pkgrel=2
pkgdesc="Perl extension for using OpenSSL"
arch=(i686 x86_64)
license=('custom:BSD')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0' 'openssl')
options=(!emptydirs)
replaces=('net-ssleay')
provides=('net-ssleay')
source=(http://www.cpan.org/authors/id/F/FL/FLORA/${_realname}-${pkgver}.tar.gz)
md5sums=('b0cd6c1681bbc0695d81be5cd852d1d0')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL -- INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete

  install -D -m644 README ${startdir}/pkg/usr/share/licenses/${pkgname}/README
}
# vim: ts=2 sw=2 et ft=sh
