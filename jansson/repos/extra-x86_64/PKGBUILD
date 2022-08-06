# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=jansson
pkgver=2.14
pkgrel=2
pkgdesc='C library for encoding, decoding and manipulating JSON data'
arch=('x86_64')
url='https://www.digip.org/jansson/'
depends=('glibc')
license=('MIT')
options=('staticlibs')
source=("https://github.com/akheron/jansson/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('5798d010e41cf8d76b66236cfb2f2543c8d082181d16bc3085ab49538d4b9929'
            'SKIP')
validpgpkeys=('B5D6953E6D5059ED7ADA0F2FD3657D24D058434C') # Petri Lehtinen <petri@digip.org>

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CFLAGS+=' -ffat-lto-objects' \
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
