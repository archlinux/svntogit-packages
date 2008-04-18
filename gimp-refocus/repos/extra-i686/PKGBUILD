# $Id$
# Maintainer: Tobias Kieslich <tobias@justdreams.de>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=gimp-refocus
_pname=refocus
pkgver=0.9.0
pkgrel=2
arch=(i686)
license=(GPL2)
pkgdesc="a sharpen plugin for gimp using FIR Wiener filtering"
depends=('gimp>=2.0.0')
url="http://refocus.sourceforge.net/"
source=(http://dl.sourceforge.net/sourceforge/${_pname}/${_pname}-${pkgver}.tar.gz \
        ${_pname}-gimp-2.0.patch ${_pname}-mirror-fix.patch ${_pname}-gimp-preview.patch)

build() {
  cd ${startdir}/src/${_pname}-${pkgver}
  # we need a *load of patches now to compile
  patch -Np0 -i ../${_pname}-gimp-2.0.patch || return 1
  patch -Np0 -i ../${_pname}-mirror-fix.patch || return 1
  patch -Np0 -i ../${_pname}-gimp-preview.patch || return 1
  aclocal
  automake -a --gnu --include-deps Makefile
  automake -a --gnu --include-deps lib/Makefile
  autoconf
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  ./configure --prefix=/usr --bindir=/usr/lib/gimp/2.0/plug-ins
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
