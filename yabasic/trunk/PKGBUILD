# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Suzy Williams <suzanne.williams3@verizon.net>

pkgname=yabasic
pkgver=2.763
pkgrel=2
pkgdesc="Yet Another Basic"
url="http://www.yabasic.de/"
depends=('libx11' 'libsm' 'ncurses')
source=("http://www.yabasic.de/download/$pkgname-$pkgver.tar.gz")

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}


