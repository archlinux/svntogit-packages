# $Id: PKGBUILD,v 1.2 2005/09/26 10:20:20 damir Exp $
# Contributor: damir <damir@archlinux.org>
# Maintainer: damir <damir@archlinux.org>

pkgname=libstroke
pkgver=0.5.1
pkgrel=2
pkgdesc="LibStroke is a stroke (mouse gesture) translation library"
depends=('glibc')
url="http://www.etla.net/libstroke/"
source=($url/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
