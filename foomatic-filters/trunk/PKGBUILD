# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
#
# build order: foomatic-db / -filters / -db-ppd / -db-engines / -db-hpijs

pkgname=foomatic-filters
pkgver=3.0_20080211
_snapver=3.0-20080211
pkgrel=1
pkgdesc="Foomatic is a system for using free software printer drivers with common spoolers on Unix"
arch=(i686 x86_64)
license=('GPL')
depends=('perl' 'libxml2')
makedepends=('enscript')
source=(http://www.linuxprinting.org/download/foomatic/$pkgname-$_snapver.tar.gz)
url="http://www.linuxprinting.org/foomatic.html"
options=('force')
md5sums=('97b517e94ac85534cdc84a446a872bc2')

build() {
   cd $startdir/src/$pkgname-$_snapver
   ./configure --prefix=/usr --sysconfdir=/etc
   sed 's|$(MAKE) PREFIX=$(DESTDIR)$(PERLPREFIX)|$(MAKE) PREFIX=$(PERLPREFIX)|' -i Makefile
   make || return 1
   make DESTDIR=$startdir/pkg install
}
