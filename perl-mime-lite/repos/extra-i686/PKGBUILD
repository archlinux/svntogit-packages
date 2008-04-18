# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Eric Johnson <eric@coding-zone.com>

pkgname=perl-mime-lite
_realname=MIME-Lite
pkgver=3.021
pkgrel=1
pkgdesc="Perl module that provides lightweight MIME generator"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl-mailtools' 'perl-mime-types' 'perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/${_realname}-$pkgver.tar.gz)
md5sums=('7b3f4b9b3f8a0023dbc62859ef9a775f')

build() {
  cd $startdir/src/${_realname}-$pkgver
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
# vim: ts=2 sw=2 et ft=sh
