# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-fcgi
pkgver=0.82
pkgrel=2
pkgdesc='Fast CGI module'
arch=(x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6')
checkdepends=('perl-fcgi-client>=0.09')
url=https://metacpan.org/release/FCGI
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/FCGI-$pkgver.tar.gz")
md5sums=(f51a6cb522c0ff25043281532ad0479f)
sha512sums=(dd962678b4c2012298c9b34cd85ffbacbdfc269b3a25cad7a77aadf1545c2ccab63ea14b44ffff727d51520f62a9ddd943deaff80a442888efd1a2caadb53334)
_ddir="FCGI-$pkgver"

build()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  unset PERL5LIB PERL_MM_OPT
  /usr/bin/perl Makefile.PL
  make
)

check()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1
  unset PERL5LIB
  make test
)

package()
(
  cd "$srcdir/$_ddir"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
