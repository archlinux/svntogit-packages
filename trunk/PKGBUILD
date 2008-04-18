# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Eric Johnson <eric@coding-zone.com>

pkgname=perl-mailtools
_realname=MailTools
pkgver=2.02
pkgrel=1
pkgdesc="Perl module that provides email tools"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/${_realname}-${pkgver}.tar.gz)
md5sums=('824bdbe6c4084739ac2d005eebb09b0e')

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
# vim: ts=2 sw=2 et ft=sh
