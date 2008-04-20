# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
#
pkgname=foomatic-db-engine
pkgver=3.0_20080420
_snapver=3.0-20080420
pkgrel=1
pkgdesc="Foomatic is a system for using free software printer drivers with common spoolers on Unix"
arch=(i686 x86_64)
license=('GPL')
depends=('perl' 'libxml2' 'foomatic-filters')
replaces=('foomatic')
conflicts=('foomatic')
source=(http://www.linuxprinting.org/download/foomatic/$pkgname-$_snapver.tar.gz)
url="http://www.linuxprinting.org/foomatic.html"
options=('force')
md5sums=('73487e627eb6ebd829a4179ace161976')

build() {
   cd $startdir/src/$pkgname-$_snapver
   ./configure --prefix=/usr
   sed 's|$(MAKE) PREFIX=$(DESTDIR)$(PERLPREFIX)|$(MAKE) PREFIX=$(PERLPREFIX)|' -i Makefile
   make || return 1
   make DESTDIR=$startdir/pkg install

   mv ${startdir}/pkg/usr/lib/perl5/site_perl/5.* ${startdir}/pkg/usr/lib/perl5/current
   find ${startdir}/pkg -name '.packlist' -exec rm -f {} \;
}
