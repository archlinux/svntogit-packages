# $Id$
# Maintainer: Paul Mattal <paul@archlinux.org>
# Contributor: Simon Csaba Endre <secsaba@pagony.net>

pkgname=cdw
pkgver=0.2.4
pkgrel=4
pkgdesc="An ncurses CD writer program which uses cdrecord and mkisofs"
arch=(i686 x86_64)
# This product is abandoned. No more releases, no more website.
#url="http://cdw.sourceforge.net/"
depends=(cdrkit lame vorbis-tools ncurses libmysqlclient perlxml)
source=(http://gerolde.archlinux.org/~paul/$pkgname-$pkgver.tar.gz \
	$pkgname.patch)
md5sums=('6d3b44c9e49d1586bf683596493f1944' \
	 '8fedc4fc5abaff83d0a0a58fd9e411ae')

build() {
  # patch
  cd $startdir/src
  # patch to fix unacceptable syntax in newer compilers
  patch -p0 <cdw.patch || return 1

  cd $pkgname-$pkgver

  # configure
  ./configure --prefix=/usr --enable-gui=no --enable-mysql || return 1

  # build
  make || return 1

  # install
  make prefix=$startdir/pkg/usr install || return 1

  # install sql file for mysql
  install -D -m644 doc/cdw.sql $startdir/pkg/usr/share/cdw/cdw.sql || return 1
}
