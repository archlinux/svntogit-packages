# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
#
pkgname=foomatic-db-hpijs
pkgver=20080420
pkgrel=1
pkgdesc="Foomatic is a system for using free software printer drivers with common spoolers on Unix - Foomatic data for the HP's HPIJS printer drivers"
arch=(i686 x86_64)
license=('GPL')
depends=('perl' 'libxml2' 'foomatic-db' 'foomatic-filters')
source=(http://www.linuxprinting.org/download/foomatic/$pkgname-$pkgver.tar.gz)
url="http://www.linux-foundation.org/en/OpenPrinting/Database/Foomatic"
md5sums=('bc5a4d8d6cda20d6f366e6eba4e9c718')

build() {
   cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/usr
   make || return 1
   make DESTDIR=$startdir/pkg install
}
