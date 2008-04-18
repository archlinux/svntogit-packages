# $Id$
# Maintainer: simo <simo@archlinux.org>
pkgname=python-gtkglext
pkgver=1.1.0
pkgrel=2
pkgdesc="Python language bindings for GtkGLExt"
arch=(i686 x86_64)
depends=('gtkglext' 'mesa' 'python-opengl')
url="http://gtkglext.sourceforge.net/"
source=(http://umn.dl.sourceforge.net/gtkglext/pygtkglext-$pkgver.tar.bz2)
license="LGPL"
md5sums=('720b421d3b8514a40189b285dd91de57')
 
build() {
  cd $startdir/src/pygtkglext-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \; 
}
