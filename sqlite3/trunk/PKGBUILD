# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=sqlite3
pkgver=3.5.8
pkgrel=1
pkgdesc="A C library that implements an SQL database engine"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.sqlite.org/"
depends=('readline')
conflicts=('sqlite')
replaces=('sqlite')
source=(http://www.sqlite.org/sqlite-$pkgver.tar.gz license.txt)
options=(!libtool)
md5sums=('1f51122bc944d9f4fdfca36464dafc56'
         'c1cdbc5544034d9012e421e75a5e4890')

build() {
  cd $startdir/src/sqlite-$pkgver
  ./configure --prefix=/usr --enable-threadsafe
  make || return 1
  make DESTDIR=$startdir/pkg install

  # license
  install -Dm644 $startdir/src/license.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/license.txt
}