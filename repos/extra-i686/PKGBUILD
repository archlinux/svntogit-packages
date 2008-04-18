# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# contributor Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=libdvdnav
pkgver=0.1.10
pkgrel=2
pkgdesc="The library for xine-dvdnav plugin."
depends=('libdvdcss')
source=(http://umn.dl.sourceforge.net/sourceforge/dvd/$pkgname-$pkgver.tar.gz)
url="http://dvd.sourceforge.net/index.shtml"
md5sums=('c8ddee96ba1182d73447eaf0bb6fde81')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
