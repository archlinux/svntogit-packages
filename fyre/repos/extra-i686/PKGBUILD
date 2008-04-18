# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=fyre
pkgver=1.0.1
pkgrel=1
pkgdesc="rendering of the Peter de Jong map"
arch=("i686" "x86_64")
license=('GPL2')
url="http://fyre.navi.cx/"
depends=('openexr>=1.4.0a' 'libglade' 'gnet')
source=("http://flapjack.navi.cx/releases/fyre/fyre-$pkgver.tar.gz")
install=$pkgname.install

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  rm $startdir/pkg/usr/share/mime/{XMLnamespaces,globs,magic,aliases,subclasses}
  rm $startdir/pkg/usr/share/mime/mime.cache
  rm $startdir/pkg/usr/share/icons/hicolor/icon-theme.cache
}

md5sums=('44d5830c527325c1ee6fa6ea92b4ba03')
