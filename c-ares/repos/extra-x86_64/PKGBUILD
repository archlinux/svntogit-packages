# $Id$
# Maintainer: Jeff Mickey <jeff@archlinux.org>
# Maintainer: Vinay S Shastry <vinayshastry@gmail.com>
pkgname=c-ares
pkgver=1.5.1
pkgrel=1
pkgdesc="c-ares is a C library that performs DNS requests and name resolves asynchronously"
url="http://daniel.haxx.se/projects/c-ares/"
arch=('i686' 'x86_64')
license=('MIT')
depends=()
source=(http://daniel.haxx.se/projects/c-ares/$pkgname-$pkgver.tar.gz)
options=('!libtool')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

md5sums=('f39acb8033391b0afebf367d314bed36')
sha1sums=('f372187931789c572d134e6362eaf39f44d4dbc1')
