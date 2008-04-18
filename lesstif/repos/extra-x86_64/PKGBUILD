# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=lesstif
pkgver=0.95.0
pkgrel=2
pkgdesc="LGPL'd re-implementation of Motif"
arch=(i686 x86_64)
depends=('freetype2' 'libxt' 'libxp')
options=('nolibtool')
source=(http://heanet.dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2
	CAN-2005-0605.patch
	64bitcleanups.patch
	c++fix.patch
        scroll.patch)
md5sums=('ab895165c149d7f95843c7584b1c7ad4' '8089c6d6e427f2357fc4e85145e04579'\
         '1234d1a45e1410c29f54612548e75127' 'b8caafffe583951e8525b145a4f78174'\
         '38c43641a01ceeebbd5816a088e1ad48')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/CAN-2005-0605.patch || return 1
  patch -Np1 -i ${startdir}/src/c++fix.patch || return 1
  patch -Np1 -i ${startdir}/src/scroll.patch || return 1
  patch -Np1 -i ${startdir}/src/64bitcleanups.patch || return 1

  ./configure --prefix=/usr --enable-production \
    --enable-nonstandard-conversions --enable-editres \
    --with-xdnd --enable-build-21 --disable-debug --enable-static
  make || return 1

  mkdir -p ${startdir}/pkg/usr/lib
  make -C lib/Mrm-2.1
  make -C lib/Mrm-2.1 DESTDIR=${startdir}/pkg install
  make appdir=/usr/share/X11/app-defaults DESTDIR=${startdir}/pkg install

  # clean-up
  rm -rf ${startdir}/pkg/usr/LessTif
  rm -f ${startdir}/pkg/usr/lib/X11/mwm/README 
  # conflicts with Shell from perl
  rm -f ${startdir}/pkg/usr/man/man3/Shell.3
  # conflicts with tcl
  rm -f ${startdir}/pkg/usr/man/man3/Object.3
}
