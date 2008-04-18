# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=perl-libintl-perl
_realname=libintl-perl
pkgver=1.16
pkgrel=3
pkgdesc="Perl Module: Localization support"
arch=(i686 x86_64)
license=('LGPL')
url="http://search.cpan.org/dist/${_realname}/"
depends=('gettext' 'perl>=5.10.0')
options=(!emptydirs)
source=(http://www.cpan.org/authors/id/G/GU/GUIDO/${_realname}-$pkgver.tar.gz)
md5sums=('7dfcd9ac3a4ff41038a2c67a733d42b9')

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
