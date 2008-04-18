# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=xaw3d
pkgver=1.5
pkgrel=4
pkgdesc="Three-D Athena widgets"
arch=('i686' 'x86_64')
url="ftp://ftp.x.org/contrib/widgets/Xaw3d"
license=('MIT')
depends=('libxp' 'libxmu' 'libxpm')
makedepends=('imake')
options=('!makeflags')
source=(ftp://ftp.x.org/contrib/widgets/Xaw3d/R6.3/Xaw3d-${pkgver}.tar.gz \
        xaw3d.patch LICENSE)
md5sums=('a77aa4ebe3be7964e4dbbc351e48277f' 'cd250186d36d64f579834f11a7f7f6a2'\
         '5b6b0242b3f53b7fe308e702abe28561')
sha1sums=('ba10e9f9a376932eed9696006e34d4618a6f588d'
          'f081b674eb34550693fdd6c997386145a077843f'
          'f4c6ea3294b6ca41e17b7a83530bd694af6f1f5a')

build() {
  cd $startdir/src/xc/lib/Xaw3d
  patch -Np1 -i ${startdir}/src/xaw3d.patch || return 1
  mkdir X11
  cd X11
  ln -sf ../../Xaw3d .
  cd ..
  xmkmf || return 1
  # fix for the lib location
  [ "$CARCH" = "x86_64" ] && sed -i -e "s:lib64:lib:g" Makefile
  make includes || return 1
  make depend || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m644 ../../../LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
