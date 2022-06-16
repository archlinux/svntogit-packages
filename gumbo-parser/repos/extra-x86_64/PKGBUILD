# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gumbo-parser
pkgver=0.10.1
pkgrel=2
pkgdesc="HTML5 parsing library in pure C99"
arch=(x86_64)
url="https://github.com/google/gumbo-parser"
license=(Apache)
depends=(glibc)
checkdepends=(gtest)
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/gumbo-parser/archive/v0.10.1.tar.gz")
sha256sums=('28463053d44a5dfbc4b77bcf49c8cee119338ffa636cc17fc3378421d714efad')

prepare() {
	cd $pkgname-$pkgver
	./autogen.sh
}

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr
	make
}

check() {
	cd $pkgname-$pkgver
	make -k check
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
