# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: john
#

pkgname=cmatrix
pkgver=1.2a
pkgrel=2
pkgdesc="Let you see the matrix code in your console"
url="http://www.asty.org/cmatrix/"
depends=('ncurses')
install=$pkgname.install
source=(http://www.asty.org/cmatrix/dist/$pkgname-$pkgver.tar.gz)
md5sums=('ebfb5733104a258173a9ccf2669968a1')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  /usr/bin/make || return 1
  /bin/mkdir -p $startdir/pkg/usr/share/fonts/misc
  /bin/cp mtx.pcf $startdir/pkg/usr/share/fonts/misc
  /usr/bin/make DESTDIR=$startdir/pkg install
}
# vim: ts=2: ft=sh
