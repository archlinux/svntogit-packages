# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
#
pkgname=texinfo
pkgver=4.11
pkgrel=2
pkgdesc="Utilities to work with and produce manuals, ASCII text, and on-line documentation from a single source file"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/texinfo/"
license=('GPL')
depends=('ncurses')
source=(ftp://ftp.gnu.org/pub/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('0c652adddc75b385ee1509fc55ff2837')

build() {
   cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/usr
   make || return 1
   make DESTDIR=$startdir/pkg install
}
