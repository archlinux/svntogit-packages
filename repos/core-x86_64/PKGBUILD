# $Id$
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=flex
pkgver=2.6.0
pkgrel=2
pkgdesc="A tool for generating text-scanning programs"
arch=('i686' 'x86_64')
url="http://flex.sourceforge.net"
license=('custom')
groups=('base-devel')
depends=('glibc' 'm4' 'sh')
makedepends=('help2man')  # needed for patch...
install=flex.install
source=(http://downloads.sourceforge.net/sourceforge/flex/flex-$pkgver.tar.xz
        flex-2.6.0-comment-style.patch)
md5sums=('3cbbfa1554d0b75fad9f8100732454de'
         '14c93c3930a8591bed2f736e28c47106')

prepare() {
  cd $pkgname-$pkgver
  
  # git commit 07d89829
  patch -p1 -i $srcdir/flex-2.6.0-comment-style.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=$pkgdir install
  ln -s flex ${pkgdir}/usr/bin/lex

  install -Dm644 COPYING \
  	$pkgdir/usr/share/licenses/$pkgname/license.txt
}

