# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=cdargs
pkgver=1.35
pkgrel=1
pkgdesc="A replacement for 'cd' that includes bookmarks/browsing for faster navigation"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.skamphausen.de/software/cdargs/"
depends=('glibc' 'ncurses' 'gcc-libs')
source=(http://www.skamphausen.de/downloads/$pkgname/$pkgname-$pkgver.tar.gz)
install=$pkgname.install

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  # install helper scripts
  mkdir -p $startdir/pkg/usr/share/cdargs
  cd contrib
  make || return 1
  make DESTDIR=$startdir/pkg install
  install $pkgname-{tcsh.csh,bash.sh} $startdir/pkg/usr/share/cdargs
}

md5sums=('50be618d67f0b9f2439526193c69c567')
