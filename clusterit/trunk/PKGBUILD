# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=clusterit
pkgver=2.5
pkgrel=1
pkgdesc="This is a collection of clustering tools, to turn your ordinary everyday pile of UNIX/Linux workstations into a speedy parallel beast. "
arch=(i686 x86_64)
# license=('custom')
url="http://www.garbled.net/clusterit.html"
depends=('libx11')
source=(http://www.garbled.net/download/$pkgname-$pkgver.tar.gz)

build() {

  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
 
  make || return 1
  make DESTDIR=$startdir/pkg INSTALL=/bin/install install

  # install license:
  # FIXME: have to find the license text to this pkg - its BSD-like according to the website
}
md5sums=('f0e772e07122e388de629fb57f7237ab')
