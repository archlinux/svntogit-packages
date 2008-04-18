# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=hugs98
pkgver=200609
pkgrel=1
pkgdesc="Haskell 98 interpreter"
arch=(i686 x86_64)
depends=('readline')
url="http://www.haskell.org/hugs"
source=(http://cvs.haskell.org/Hugs/downloads/2006-09/$pkgname-plus-Sep2006.tar.gz)
md5sums=('e03e0ad79750d037237c47ebe33fa20e')

build() {
  if [ "$CARCH" = "x86_64" ]; then
    unset CFLAGS
  fi

  cd $startdir/src/$pkgname-plus-Sep2006
  #rm config.cache
  ./configure --prefix=/usr --with-pthreads 
  make  || return 1
  make DESTDIR=$startdir/pkg install
}
