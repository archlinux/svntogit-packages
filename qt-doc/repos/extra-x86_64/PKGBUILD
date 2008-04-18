# $Id$
# Contributor: Vinay S Shastry (vinayshastry@gmail.com)
# Maintainer: Vinay S Shastry (vinayshastry@gmail.com)

pkgname=qt-doc
pkgver=4.3.3
pkgrel=1
pkgdesc="The QT gui toolkit documentation."
arch=('i686' 'x86_64')
url="http://www.trolltech.com/products/qt"
_pkgfqn=qt-x11-opensource-src-$pkgver
depends=('qt>=4.3.3-1')
source=(ftp://ftp.trolltech.com/qt/source/$_pkgfqn.tar.gz)
license=('GPL2')
options=('docs')
replaces=('qt4-doc')
provides=('qt4-doc')
conflicts=('qt4-doc')

build() {
  cd $startdir/src/$_pkgfqn
  mkdir -p $startdir/pkg/usr/share/doc/qt
  cp -r doc/* $startdir/pkg/usr/share/doc/qt
}

md5sums=('19678fe35170559cd6a6fa531c57799c')
