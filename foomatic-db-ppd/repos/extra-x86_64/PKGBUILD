# $Id$
# Maintainer: arjan <arjan@archlinux.org>
#
pkgname=foomatic-db-ppd
pkgver=3.0_20080211
_snapver=20080211
pkgrel=1
pkgdesc="Foomatic is a system for using free software printer drivers with common spoolers on Unix - the ppd files"
arch=(i686 x86_64)
license=('GPL')
install=ppd.install
depends=('perl' 'libxml2' 'foomatic-filters')
source=(http://www.linuxprinting.org/download/foomatic/foomatic-filters-ppds-$_snapver.tar.gz)
url="http://www.linux-foundation.org/en/OpenPrinting/Database/Foomatic"
options=('force')
md5sums=('7f4ebe30453e1f85b82cee2d6ec6c1a0')

build() {
 cd $startdir/src/foomatic-filters-ppds-$_snapver
 mkdir -p $startdir/pkg/usr/share/foomatic
 cp -r share/ppd $startdir/pkg/usr/share/foomatic
}
