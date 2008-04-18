# $Id$
# Contributor: Sarah Hay <sarah@archlinux.org>
# Maintainer: Arjan Timmerman <arjan@soulfly.nl>

pkgname=perl-extutils-pkgconfig
_realname=ExtUtils-PkgConfig
pkgver=1.07
pkgrel=3
pkgdesc="The Perl Pkgconfig module"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk2-perl.sourceforge.net/"
depends=('perl>=5.10.0')
replaces=(extutils-pkgconfig)
source=(http://dl.sourceforge.net/sourceforge/gtk2-perl/${_realname}-${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=(a8cf945d09c6458cb27228218e9a2f45)

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  find ${startdir}/pkg -name '.packlist' -delete
  find ${startdir}/pkg -name 'perllocal.pod' -delete
}
