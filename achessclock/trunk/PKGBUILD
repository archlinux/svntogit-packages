# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
pkgname=achessclock
pkgver=0.9.2b
pkgrel=3
pkgdesc="Angus' Chess Clock"
depends=('glibc' 'gtk>=1.0.0' 'ncurses')
source=(http://ess4.engr.uvic.ca/proj/AChessClock/AChessClock-$pkgver.tar.gz)
url="http://ess4.engr.uvic.ca/proj/AChessClock/";
md5sums=('d0a725bed031056e7e1e9614f31eb502')

build() {
   cd $startdir/src/AChessClock-$pkgver
   ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
   make || return 1
   make prefix=$startdir/pkg/usr sysconfdir=$startdir/pkg/etc localstatedir=$startdir/pkg/var install
}
