# $Id$
#Maintainer: Simo Leone <simo@archlinux.org>
#Contributor: Simo Leone <neotuli@gmail.com>
pkgname=aspell-fi
pkgver=0.7
pkgrel=1
pkgdesc="Finnish dictionary for aspell"
url="http://aspell.net"
license=""
depends=('aspell')
conflicts=()
replaces=()
backup=()
install=
source=(ftp://ftp.gnu.org/gnu/aspell/dict/fi/aspell6-fi-$pkgver-0.tar.bz2)
md5sums=('6d1032116982c0efab1af8fce83259c0')

build() {
  cd $startdir/src/aspell6-fi-$pkgver-0
  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg install
}
