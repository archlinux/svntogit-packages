# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=glib-perl
_realname=Glib
pkgver=1.182
pkgrel=1
pkgdesc="Perl wrappers for glib 2.x, including GObject"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk2-perl.sourceforge.net/"
options=('!emptydirs')
depends=('glib2>=2.16.3' 'perl>=5.10.0')
makedepends=('perl-extutils-depends>=0.300' 'perl-extutils-pkgconfig>=1.11')
source=(http://downloads.sourceforge.net/sourceforge/gtk2-perl/${_realname}-${pkgver}.tar.gz)
md5sums=('23e0fcd52760820b70758adf591b84eb')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  find ${startdir}/pkg -name '.packlist' -delete
  find ${startdir}/pkg -name 'perllocal.pod' -delete
}
