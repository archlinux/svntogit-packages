# $Id$
# Maintainer: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=dmenu
pkgver=3.4
pkgrel=1
pkgdesc="Dynamic X menu"
url="http://www.suckless.org/wiki/tools/xlib"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11')
source=(http://suckless.org/download/$pkgname-$pkgver.tar.gz 
		dmenu.patch)

build()
{
  cd $startdir/src/$pkgname-$pkgver
  patch -p1 < ../dmenu.patch
  make || return 1
  make DESTDIR=$startdir/pkg install

  #install license
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
  cp LICENSE $startdir/pkg/usr/share/licenses/$pkgname/
}

md5sums=('9b5c9d427c6896e50da1dc77a2405065'
         '067b6e08e48c535d7f3fdecd4d602700')
sha1sums=('f9defb210da9fcce35982ba5a2ff5ad8fe8d6a63'
          '94390111c586116c57f3a901bf5baa49c5ef1aec')
