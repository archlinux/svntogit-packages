# $Id$
# Maintainer: Tom Killian <tom@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=perl-newt
pkgver=1.08
pkgrel=3
pkgdesc="Perl bindings for the Newt text mode widget-based windowing toolkit"
arch=('i686')
license=('PerlArtistic')
depends=('popt' 'slang' 'tcl' 'perl>=5.10.0')
options=(!emptydirs)
url="ftp://ftp.msg.com.mx/pub/Newt/"
source=(ftp://ftp.msg.com.mx/pub/Newt/Newt-${pkgver}.tar.gz
	newt-1.08-slang-2.patch
	newt-1.08-gcc-4.patch)
md5sums=('462f3fabc05ec5dd4a2d554c01568bdf' '1498b9b6479f189524b89aaa688f5931'\
         '436eca000452f8aa06d780b09529fe49')


build() {
  cd ${startdir}/src/Newt-${pkgver}
  patch -Np1 -i ${startdir}/src/newt-1.08-slang-2.patch || return 1
  patch -Np1 -i ${startdir}/src/newt-1.08-gcc-4.patch || return 1

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${startdir}/pkg || return 1

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
