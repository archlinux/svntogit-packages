# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=groff
pkgver=1.19.2
pkgrel=4
pkgdesc="GNU troff text-formatting system"
arch=(i686 x86_64)
url="http://www.gnu.org/software/groff/groff.html"
license=('GPL')
groups=('base')
depends=('perl' 'gcc-libs')
source=(ftp://ftp.gnu.org/gnu/groff/groff-$pkgver.tar.gz
        man-utf8.tmac)
md5sums=('f7c9cf2e4b9967d3af167d7c9fadaae4'
         'faefbef2b05ee5438b632464607c6cc4')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --without-x
  mkdir -p $startdir/pkg/usr
  make -j1 || return 1
  make prefix=$startdir/pkg/usr install
	cd $startdir/pkg/usr/bin
	# needed for xman
	ln -s eqn geqn
	ln -s tbl gtbl
	ln -s soelim zsoelim
  rm -rf $startdir/pkg/usr/lib

  # Fix some issues when encoding to utf8 man pages
  #  The output chars don't match keyboard chars...
  cat $startdir/src/man-utf8.tmac >> \
    $startdir/pkg/usr/share/groff/site-tmac/man.local
}
