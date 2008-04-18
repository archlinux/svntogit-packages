# $Id$
# Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=perl-sgmls
_realname=SGMLSpm
pkgver=1.03
pkgrel=3
pkgdesc="Class for postprocessing the output from the sgmls and nsgmls parsers"
arch=(i686 x86_64)
license=("GPL")
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
source=(http://search.cpan.org/CPAN/authors/id/D/DM/DMEGG/${_realname}-${pkgver}ii.tar.gz)
options=(!emptydirs)
md5sums=('5bcb197fd42e67d51c739b1414d514a7')

build()
{
  cd  $startdir/src/${_realname}
  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/perl5/vendor_perl
  make BINDIR=${startdir}/pkg/usr/bin \
       PERL5DIR=${startdir}/pkg/usr/share/perl5/vendor_perl install
}
