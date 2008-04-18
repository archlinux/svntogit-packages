# $Id$
# Maintainer: James Rayner <james@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=tango-icon-theme-extras
pkgver=0.1.0
pkgrel=2
pkgdesc="Extra icons for Tango"
url="http://tango-project.org"
depends=('tango-icon-theme')
makedepends=('imagemagick' 'icon-naming-utils')
source=(http://tango-project.org/releases/$pkgname-$pkgver.tar.gz)
md5sums=('caaceaec7b61f1cbda0db9842f9db281')

build() {
  cd $startdir/src/$pkgname-$pkgver --enable-png-creation
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
