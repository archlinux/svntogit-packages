# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libzip
pkgver=0.8
pkgrel=1
pkgdesc="libzip is a C library for reading, creating, and modifying zip archives"
url="http://www.nih.at/libzip/index.html"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('zlib')
source=(http://www.nih.at/libzip/$pkgname-$pkgver.tar.gz)
options=(!libtool)

build() {
        cd $startdir/src/$pkgname-$pkgver
         ./configure --prefix=/usr
        make || return 1
        make DESTDIR=$startdir/pkg install
}
md5sums=('b0087c2a12b312f8ec2df1052b2acb4f')
