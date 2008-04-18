# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: orelien <orelien@chez.com>
#

pkgname=windowmaker-extra
pkgver=0.1
pkgrel=2
pkgdesc="Extra WindowMaker icons and themes."
depends=('windowmaker')
source=(http://www.windowmaker.org/pub/source/release/WindowMaker-extra-$pkgver.tar.gz)
url="http://www.windowmaker.org/"
md5sums=('07c7700daaaf232bc490f5abaabef085')

build() {
  cd $startdir/src/WindowMaker-extra-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  rm -f $startdir/pkg/usr/share/WindowMaker/Icons/xv.xpm
}
# vim: ts=2 sw=2 et ft=sh
