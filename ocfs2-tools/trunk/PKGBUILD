# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=ocfs2-tools
pkgver=1.2.4
pkgrel=1
pkgdesc="Oracle Cluster File System 2 utilities"
arch=(i686 x86_64)
url="http://oss.oracle.com/projects/ocfs2-tools/"
depends=('e2fsprogs' 'glib2')
license=('GPL')
source=(http://oss.oracle.com/projects/ocfs2-tools/dist/files/source/v1.2/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make -j1 LDFLAGS=-L/usr/lib || return 1
  make DESTDIR=$startdir/pkg install
  install -m 755 -D $startdir/src/$pkgname-$pkgver/vendor/common/ocfs2.init \
	$startdir/pkg/etc/rc.d/ocfs2
  install -m 755 -D $startdir/src/$pkgname-$pkgver/vendor/common/o2cb.init \
	$startdir/pkg/etc/rc.d/o2cb
}
md5sums=('f0998db9e2b3b8cca7bd1963cb1ad2b8')
