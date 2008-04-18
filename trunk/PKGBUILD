# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=flex
pkgver=2.5.33
pkgrel=4
force=y
pkgdesc="A tool for generating text-scanning programs"
arch=(i686 x86_64)
url="http://flex.sourceforge.net"
license=('custom')
groups=('base-devel')
depends=('glibc' 'sh')
source=(http://downloads.sourceforge.net/sourceforge/flex/flex-$pkgver.tar.bz2 
	lex.sh)
md5sums=('343374a00b38d9e39d1158b71af37150' 'f725259ec23a9e87ee29e2ef82eda9a5')

build() {
  cd $startdir/src/$pkgname-$pkgver || return 1
  
  # configure
  ./configure --prefix=/usr --mandir=/usr/share/man || return 1

  # build and install
  make || return 1
  make prefix=$startdir/pkg/usr mandir=$startdir/pkg/usr/share/man install || return 1
  install -D -m755 $startdir/src/lex.sh $startdir/pkg/usr/bin/lex || return 1

  # install license
  install -D -m644 COPYING \
  	$startdir/pkg/usr/share/licenses/$pkgname/license.txt || return 1
}
