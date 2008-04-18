# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
#

pkgname=lxsplit
pkgver=0.1.1
pkgrel=1
pkgdesc="Command-line file splitter/joiner compatible with any HJSplit version"
url="http://www.freebyte.com/hjsplit/#linux"
depends=('glibc')
source=(http://www.freebyte.com/download/$pkgname.tar.gz)
md5sums=('dd60962d82cf79d9ee0f139c81f6aefb')

build() {
  cd $startdir/src/$pkgname-$pkgver
  /bin/mkdir -p $startdir/pkg/usr/bin
  /usr/bin/make || return 1
  /usr/bin/make INSTALL_PATH=$startdir/pkg/usr/bin install
}
