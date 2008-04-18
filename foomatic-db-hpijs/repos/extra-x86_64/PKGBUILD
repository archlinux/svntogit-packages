# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
#
pkgname=foomatic-db-hpijs
pkgver=20080211
pkgrel=1
pkgdesc="Foomatic is a system for using free software printer drivers with common spoolers on Unix - Foomatic data for the HP's HPIJS printer drivers"
arch=(i686 x86_64)
license=('GPL')
depends=('perl' 'libxml2' 'foomatic-db' 'foomatic-filters')
source=(http://www.linuxprinting.org/download/foomatic/$pkgname-$pkgver.tar.gz)
url="http://www.linux-foundation.org/en/OpenPrinting/Database/Foomatic"
md5sums=('58bef426f769219592b6b0c81357a04a')

build() {
   cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/usr
   make || return 1
   make DESTDIR=$startdir/pkg install
}
