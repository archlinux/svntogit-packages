# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=perl-netaddr-ip
_realname=NetAddr-IP
pkgver=4.007
pkgrel=2
pkgdesc="Perl module to manage IP addresses and subnets."
arch=(i686 x86_64)
license=('PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
url="http://search.cpan.org/dist/${_realname}/"
source=(http://search.cpan.org/CPAN/authors/id/L/LU/LUISMUNOZ/${_realname}-${pkgver}.tar.gz)
md5sums=('21825dc072e688f733e03da24e4d058b')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
