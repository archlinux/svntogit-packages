# $Id$
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
pkgname=userui
pkgver=0.7.2
pkgrel=2
pkgdesc="Software suspend userspace user interface"
url="http://www.suspend2.net"
license="GPL"
install=userui.install
depends=()
arch=('i686' 'x86_64') 
makedepends=('libmng' 'libpng' 'libjpeg' 'zlib' 'lcms' 'freetype2')
source=(http://www.suspend2.net/downloads/all/suspend2-$pkgname-$pkgver.tar.gz \
        userui-install userui-hook)
md5sums=('7403ebf48a598ba13d5155b2660a06df'
         'f8d0f02f08bfe4e07ea9243e8823063d'
         '26961130f7458b3ab65cec6d751da83d')

build() {
  MAKEFLAGS+="-j1"
  cd $startdir/src/suspend2-$pkgname-$pkgver
  sed 's|^all: fbsplash usplash $(TARGETS)$|all: fbsplash $(TARGETS)|' -i Makefile
  sed 's|^MODULES = text fbsplash usplash$|MODULES = text fbsplash|' -i Makefile
  sed 's|-m 755|-D -m755|g' -i ./Makefile
  install -D -m644 $startdir/src/userui-install $startdir/pkg/lib/initcpio/install/userui
  install -D -m644 $startdir/src/userui-hook $startdir/pkg/lib/initcpio/hooks/userui
  make clean
  make LDFLAGS=-static || return 1
  make DESTDIR=$startdir/pkg PREFIX=/usr install
}
