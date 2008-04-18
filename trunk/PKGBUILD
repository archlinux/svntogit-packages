# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: K. Piche <kpiche@rogers.com>

pkgname=perl-bit-vector
pkgver=6.4
pkgrel=3
pkgdesc='Efficient bit vector, set of integers and "big int" math library'
arch=(i686 x86_64)
license=('GPL' 'LGPL' 'PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl-carp-clan' 'perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/S/ST/STBEY/Bit-Vector-$pkgver.tar.gz)
md5sums=('681433ff4f0b4da95dc5c560b7f5cc31')

build() {
  cd $startdir/src/Bit-Vector-$pkgver
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
