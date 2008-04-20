# $Id$
# Maintainer: arjan <arjan@archlinux.org>
#
pkgname=foomatic-db-ppd
pkgver=3.0_20080420
_snapver=20080420
pkgrel=1
pkgdesc="Foomatic is a system for using free software printer drivers with common spoolers on Unix - the ppd files"
arch=(i686 x86_64)
license=('GPL')
install=ppd.install
depends=('perl' 'libxml2' 'foomatic-filters')
source=(http://www.linuxprinting.org/download/foomatic/foomatic-filters-ppds-$_snapver.tar.gz)
url="http://www.linux-foundation.org/en/OpenPrinting/Database/Foomatic"
options=('force')
md5sums=('27714375b14a652835afd49df1712cca')

build() {
 cd $startdir/src/foomatic-filters-ppds-$_snapver
 mkdir -p $startdir/pkg/usr/share/foomatic
 cp -r share/ppd $startdir/pkg/usr/share/foomatic
}
