# $Id$
# Maintainer: Paul Mattal <paul@archlinux.org>
pkgname=tightvnc
pkgver=1.3.9
pkgrel=4
pkgdesc="VNC Unix server && viewer"
arch=(i686 x86_64)
license=('GPL')
url="http://www.tightvnc.com"
depends=('libjpeg' 'zlib' 'libxaw')
makedepends=('imake')
conflicts=('vnc')
source=(http://dl.sf.net/sourceforge/vnc-tight/$pkgname-${pkgver}_unixsrc.tar.bz2 tightvnc-fontpath-xcolors.patch)
md5sums=('49a0748ea52793f2e3069e05af28f716' 'd8402ee60190fa4a4c301df48dae6762')

build() {
  export MAKEFLAGS="-j1"
  cd $startdir/src/vnc_unixsrc || return 1
  patch -Np1 -i ../tightvnc-fontpath-xcolors.patch || return 1
  sed -i 's|/usr/local/|/usr/share/|' vncserver || return 1

  xmkmf || return 1
  make World || return 1
  cd Xvnc || return 1
  ./configure || return 1
  sed 's|PROTO_DEFINES =|PROTO_DEFINES = -D_XOPEN_SOURCE=500L|' \
  	-i programs/Xserver/os/Makefile lib/font/fc/Makefile || return 1
  make || return 1
  cd .. || return 1
  mkdir -p $startdir/pkg/usr/bin $startdir/pkg/usr/man/man1 || return 1
  ./vncinstall $startdir/pkg/usr/bin $startdir/pkg/usr/man || return 1
  
  # install java classes
  mkdir -p $startdir/pkg/usr/share/vnc/classes || return 1
  install -D -m644 $startdir/src/vnc_unixsrc/classes/* \
  	$startdir/pkg/usr/share/vnc/classes || return 1
}
