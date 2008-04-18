# $Id$
# Maintainer: gregor <gregor@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=mhash
pkgver=0.9.9
pkgrel=1
pkgdesc="A thread-safe hash library which provides a uniform interface to hash algorithms (MD5, SHA-1, HAVAL, etc"
arch=('i686' 'x86_64')
url="http://mhash.sourceforge.net/"
license=('LGPL')
depends=('glibc')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/mhash/$pkgname-$pkgver.tar.bz2)
md5sums=('d113a853e0ac21c49c5a1acea0daaade')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-static
  make || return 1
  make prefix=$startdir/pkg/usr install
}
