# $Id$
# Maintainer: Jan de Groot <jan@archlinux.org>

pkgname=perl-module-build
pkgver=0.28.08
pkgrel=1
pkgdesc="The Perl build module"
arch=(i686 x86_64)
license=('perl' 'GPL')
url="http://search.cpan.org/~kwilliams/Module-Build/"
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/K/KW/KWILLIAMS/Module-Build-0.2808.tar.gz)
md5sums=('b8e457b1a4b72c46bcec3d9bce87329b')

build() {
  cd $startdir/src/Module-Build-0.2808
  eval `perl -V:archname`
  perl Makefile.PL \
       INSTALLARCHLIB=/usr/lib/perl5/current/${archname} \
       INSTALLSITELIB=/usr/lib/perl5/site_perl/current \
       INSTALLSITEARCH=/usr/lib/perl5/site_perl/current/${archname}
  make || return 1
  make DESTDIR=${startdir}/pkg install
  find ${startdir}/pkg -name '.packlist' -exec rm -f {} \;
  find ${startdir}/pkg -name 'perllocal.pod' -exec rm -f {} \;
}
