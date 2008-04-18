# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=cscope
pkgver=15.6
pkgrel=1
pkgdesc="Cscope is a developers tool for browsing program code"
arch=(i686 x86_64)
source=(http://belnet.dl.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('beb6032a301bb11524aec74bfb5e4840')
url="http://cscope.sourceforge.net/index.html"
depends=(ncurses)
build() {
cd $startdir/src/$pkgname-$pkgver
#patch -Np1 -i ../../cscope.patch
./configure --prefix=/usr
make || return 1
make prefix=$startdir/pkg/usr install
}
md5sums=('db87833f90d8267b1fc0c419cfc4d219')
