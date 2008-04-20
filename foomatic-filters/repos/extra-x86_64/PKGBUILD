# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
#
# build order: foomatic-db / -filters / -db-ppd / -db-engines / -db-hpijs

pkgname=foomatic-filters
pkgver=3.0_20080420
_snapver=3.0-20080420
pkgrel=1
pkgdesc="Foomatic is a system for using free software printer drivers with common spoolers on Unix"
arch=(i686 x86_64)
license=('GPL')
depends=('perl' 'libxml2')
makedepends=('enscript')
source=(http://www.linuxprinting.org/download/foomatic/$pkgname-$_snapver.tar.gz)
url="http://www.linuxprinting.org/foomatic.html"
options=('force')
md5sums=('272335d7c459f6cfb4216ed88ff86a58')

build() {
   cd $startdir/src/$pkgname-$_snapver
   ./configure --prefix=/usr --sysconfdir=/etc
   sed 's|$(MAKE) PREFIX=$(DESTDIR)$(PERLPREFIX)|$(MAKE) PREFIX=$(PERLPREFIX)|' -i Makefile
   make || return 1
   make DESTDIR=$startdir/pkg install
}
