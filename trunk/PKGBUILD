# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=perl-net-dns
_realname=Net-DNS
pkgver=0.62
pkgrel=1
pkgdesc="Perl Module: Interface to the DNS resolver."
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl-digest-hmac' 'perl-net-ip' 'perl>=5.10.0')
source=(http://www.cpan.org/authors/id/O/OL/OLAF/${_realname}-$pkgver.tar.gz)
replaces=('net-dns')
provides=('net-dns')
options=(!emptydirs)
md5sums=('91366517392283a909ee37d3c1c64904')

build() {
  cd $startdir/src/${_realname}-${pkgver}
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
# vim: ts=2 sw=2 et ft=sh
