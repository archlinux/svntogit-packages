# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
#
pkgname=foomatic-db
pkgver=3.0_20080420
_snapver=3.0-20080420
pkgrel=1
pkgdesc="Foomatic is a system for using free software printer drivers with common spoolers on Unix"
arch=(i686 x86_64)
license=('GPL' 'custom')
depends=('perl' 'libxml2')
source=(http://www.linuxprinting.org/download/foomatic/$pkgname-$_snapver.tar.gz)
url="http://www.linuxprinting.org/foomatic.html"
options=('force')
md5sums=('b8f48ba660b4e8ee038533a509a44597')

build() {
   cd $startdir/src/$pkgname-*
   ./configure --prefix=/usr
   make || return 1
   make DESTDIR=$startdir/pkg install
   install -Dm644 $startdir/src/$pkgname-*/COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
