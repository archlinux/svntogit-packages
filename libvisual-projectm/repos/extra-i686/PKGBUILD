# $Id: PKGBUILD,v 1.1 2006/09/05 18:16:10 alexander Exp $
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
pkgname=libvisual-projectm
pkgver=0.99
pkgrel=1
pkgdesc="ProjectM XMMS plugin"
arch=(i686)
url="http://xmms-projectm.sourceforge.net"
license="GPL"
depends=('projectm' 'libvisual>=0.4.0' 'sdl')
makedepends=('pkgconfig')
options=(NOLIBTOOL)
source=(http://puzzle.dl.sourceforge.net/sourceforge/xmms-projectm/libvisual-projectM-$pkgver.tar.bz2) 

build() {
  cd $startdir/src/libvisual-projectM
  ./configure --prefix=/usr
  make || return
  make DESTDIR=$startdir/pkg install
}
md5sums=('be076af79aff508fb75241b061937c04')
