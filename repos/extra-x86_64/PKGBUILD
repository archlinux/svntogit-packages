# Maintainer: AndyRTR <andyrtr@archlinux.org>

pkgname=libfreehand
pkgver=0.1.2
pkgrel=4
pkgdesc="a library for import of Aldus/Macromedia/Adobe FreeHand documents"
arch=('x86_64')
url="https://wiki.documentfoundation.org/DLP/Libraries/libfreehand"
license=('MPL2')
depends=('librevenge' 'lcms2')
makedepends=('boost' 'cppunit' 'gperf' 'doxygen')
source=("https://dev-www.libreoffice.org/src/libfreehand/$pkgname-$pkgver.tar.xz"
        'libfreehand-0.1.2-icu-fix.patch')
sha256sums=('0e422d1564a6dbf22a9af598535425271e583514c0f7ba7d9091676420de34ac'
            '11b5b5fcbb4f427486e83ee042cd3f2b030bcf8238f5d1925942416067d0254b')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i $srcdir/libfreehand-0.1.2-icu-fix.patch
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --disable-werror
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
