# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=windowmaker
pkgver=0.92.0
pkgrel=4
pkgdesc="An X11 window manager with a NEXTSTEP look and feel"
arch=(i686 x86_64)
depends=('libxinerama' 'libpng' 'libxpm' 'libxft' 'libtiff' 'libungif')
source=(ftp://ftp.windowmaker.info/pub/source/release/WindowMaker-$pkgver.tar.bz2 windowmaker-gcc4.patch.tar.bz2)
url="http://www.windowmaker.info/"
md5sums=('aaac5421b686ed2d3e6ab65229c98097' 'd9fb6a9c255f5c03d0e0c83dc3cd2320')

build() {
  cd $startdir/src/WindowMaker-$pkgver
  patch -Np1 -i ../windowmaker-gcc4.patch
  aclocal
  autoconf
  automake
  [ -z "$LINGUAS" ] && export LINGUAS="`ls po/*.po | sed 's:po/\(.*\)\.po$:\1:'`"
  ./configure --prefix=/usr --sysconfdir=/etc \
    --with-gnustepdir=/usr/share/GNUstep --with-nlsdir=/usr/share/locale \
    --enable-xinerama 
  make || return 1
  make DESTDIR=$startdir/pkg install
  # libtoolslay
  find $startdir/pkg -name '*.la' -exec rm {} \;
}

