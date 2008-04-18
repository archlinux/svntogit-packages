# $Id$
# Maintainer: damir <damir@archlinux.org>
pkgname=bioperl
pkgver=1.5.1
pkgrel=2
pkgdesc="A collection of perl modules that facilitate the development of perl scripts for bioinformatics applications"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://www.bioperl.org"
depends=('perl>=5.10.0')
source=($url/DIST/$pkgname-$pkgver.tar.gz)
options=(!emptydirs)
md5sums=('f510c871a1d17ac4ccc8ad3e6c9bad17')

build() {
  cd $startdir/src/$pkgname-$pkgver
#  yes a | perl Makefile.PL
#  make || return 1
#  make DESTDIR=$startdir/pkg install

#    mv $startdir/pkg/usr/lib/perl5/site_perl/?.?.? $startdir/pkg/usr/lib/perl5/site_perl/current
#  rm -rf $startdir/pkg/usr/lib/perl5/?.?.?

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
