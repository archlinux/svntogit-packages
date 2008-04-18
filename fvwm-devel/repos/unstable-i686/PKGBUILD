# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Tobias Kieslich <tobias@archlinux.org>

pkgname=fvwm-devel
pkgver=2.5.25
pkgrel=1
pkgdesc="A multiple large virtual desktop window manager originally derived from twm"
arch=('i686' 'x86_64')
url="http://www.fvwm.org"
license=('GPL' 'custom')
depends=('imlib' 'fribidi' 'perl' 'libstroke' 'libxpm' 'readline' 'librsvg')
makedepends=('pkgconfig')
conflicts=('fvwm')
provides=("fvwm=$pkgver")
source=(ftp://ftp.fvwm.org/pub/fvwm/version-2/fvwm-${pkgver}.tar.bz2 ${pkgname}.desktop)
md5sums=('f220489bd5619f10d2673c2d4d38436b' '3f5bcb246e035ff29aa5bf54487a3db4')
sha1sums=('8e0f0b1eb888f7fcc27a0dbcc32a5b0f2895df2b' '17db773870637b410ceb4f68743dbd517bc5c599')

build() {
  cd ${startdir}/src/fvwm-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --with-stroke
  make || return 1
  make DESTDIR=${startdir}/pkg install
  mkdir -p ${startdir}/pkg/etc/fvwm
  cp sample.fvwmrc/* ${startdir}/pkg/etc/fvwm
  rm -f ${startdir}/pkg/etc/fvwm/{Makefile,Makefile.am,Makefile.in}
  install -Dm 644 ../${pkgname}.desktop \
    ${startdir}/pkg/etc/X11/sessions/${pkgname}.desktop

  #install license
  install -D -m0644 $startdir/src/fvwm-${pkgver}/COPYING \
                    $startdir/pkg/usr/share/licenses/${pkgname}/COPYING
}
