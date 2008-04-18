# $Id$
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>

pkgname=perl-term-readkey
pkgver=2.30
pkgrel=2
pkgdesc="A perl module dedicated to providing simple control over terminal driver modes."
arch=('i686' 'x86_64')
license=('custom')
depends=('perl>=5.10.0' 'glibc')
url="http://cpan.org/modules/by-module/Term"
source=(http://cpan.org/modules/by-module/Term/TermReadKey-$pkgver.tar.gz)
md5sums=('f0ef2cea8acfbcc58d865c05b0c7e1ff')
options=('!emptydirs')
build()
{
  cd $startdir/src/TermReadKey-$pkgver
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  install -d $startdir/pkg/usr/share/licenses/$pkgname/
  head -7 README > $startdir/pkg/usr/share/licenses/$pkgname/LICENSE

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
