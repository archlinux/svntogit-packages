# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: Arjan Timmerman <arjan@soulfly.nl>

pkgname=perl-extutils-depends
_realname=ExtUtils-Depends
pkgver=0.300
pkgrel=1
pkgdesc="The Perl depends module"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://gtk2-perl.sourceforge.net/"
depends=('perl>=5.10.0')
source=(http://downloads.sourceforge.net/sourceforge/gtk2-perl/${_realname}-${pkgver}.tar.gz)
replaces=('extutils-depends')
options=('!emptydirs')
md5sums=('69061666b5f96663e0a1266c1d76ad6b')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  find ${startdir}/pkg -name '.packlist' -delete
  find ${startdir}/pkg -name 'perllocal.pod' -delete
}
