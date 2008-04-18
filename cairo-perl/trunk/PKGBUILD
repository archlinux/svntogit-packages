# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=cairo-perl
_realname=Cairo
pkgver=1.044
pkgrel=1
pkgdesc="Perl wrappers for cairo"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk2-perl.sourceforge.net/"
options=('!emptydirs')
depends=('cairo>=1.4.10' 'perl>=5.10.0')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig')
source=(http://downloads.sourceforge.net/sourceforge/gtk2-perl/${_realname}-${pkgver}.tar.gz)
md5sums=('45c2043e5e91d8ccb45329867b29e364')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  find ${startdir}/pkg -name '.packlist' -delete
  find ${startdir}/pkg -name 'perllocal.pod' -delete
}
