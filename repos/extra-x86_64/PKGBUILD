# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=perl-anyevent
_srcname=AnyEvent
pkgver=2.8
pkgrel=6
pkgdesc="Perl/CPAN AnyEvent module - Framework for multiple event loops"
license=('PerlArtistic')
arch=(i686 x86_64)
url="http://search.cpan.org/dist/${_srcname}/"
depends=('perl-event' 'glib-perl' 'perl>=5.10.0')
options=(force !emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/${_srcname}-${pkgver}.tar.gz)
md5sums=('cb600241f9108459c7621656339cc442')

build() {
  cd ${startdir}/src/${_srcname}-${pkgver}
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
