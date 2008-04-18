# $Id$
# Maintainer: 
pkgname=tpctl
pkgver=4.15
pkgrel=1
pkgdesc="Extra utilities for Thinkpad laptops"
url="http://tpctl.sourceforge.net"
source=(http://dl.sourceforge.net/sourceforge/tpctl/tpctl_$pkgver.tar.gz)
md5sums=('d8d84c592dfae6f53cf43824c0c78506')
 
build() { 
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make DEST=$startdir/pkg install
}  
