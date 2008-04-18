# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=xsane
pkgver=0.995
pkgrel=1
pkgdesc="A GTK-based X11 frontend for SANE and plugin for Gimp."
arch=(i686 x86_64)
license=('GPL2')
makedepends=('gimp')
depends=('gtk2' 'lcms' 'sane' 'zlib')
install=$pkgname.install
source=(http://www.xsane.org/download/$pkgname-$pkgver.tar.gz)
url="http://www.xsane.org"

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr --disable-gimp
  /usr/bin/make || return 1
  /usr/bin/make prefix=$startdir/pkg/usr install
  # build xsane with gimp
  make clean
  ./configure --prefix=/usr
  /usr/bin/make || return 1
  install -D -m755 $startdir/src/$pkgname-$pkgver/src/xsane $startdir/pkg/usr/bin/xsane-gimp
  ## For making Gimp Plugin available 
  /bin/mkdir -p $startdir/pkg/usr/lib/gimp/2.0/plug-ins
  cd $startdir/pkg/usr/lib/gimp/2.0/plug-ins/
  /bin/ln -s ../../../../bin/xsane-gimp xsane
}
md5sums=('5aaedb75973c3b13b136edec714e3fe8')
