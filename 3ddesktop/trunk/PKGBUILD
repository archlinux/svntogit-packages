# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=3ddesktop
pkgver=0.2.9
pkgrel=2
pkgdesc="a 3d virtual desktop switcher (opengl/mesa)"
url="http://desk3d.sourceforge.net"
depends=('freetype2' 'libxi' 'libxmu' 'imlib2' 'glut')

source=(http://easynews.dl.sourceforge.net/sourceforge/desk3d/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc/3ddesktop
  make || return 1
  make prefix=$startdir/pkg/usr sysconfdir=$startdir/pkg/etc/3ddesktop install
}
