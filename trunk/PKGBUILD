# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=c-ares
pkgver=1.14.0
pkgrel=1
pkgdesc='C library that performs DNS requests and name resolves asynchronously'
arch=('x86_64')
url='https://c-ares.haxx.se/'
license=('custom')
depends=('glibc')
source=("https://c-ares.haxx.se/download/$pkgname-$pkgver.tar.gz"{,.asc}
        'LICENSE')
sha512sums=('30cd3f8c4eea15f994b2ceb44d84e506858f69f624e651e39bb4db523fea9ad5e8906b75abf07131ae364be19172274ed4053059669091f21ce4463cdbb857bf'
            'SKIP'
            '55e8607392c5f82ed85e3580fa632dfdc2dcd0b1a5e918dc61d00532c15c11ecb709f6007b65805c1fbe8fcd21ee794c9e4a9638c97ac1f4960b2654010a4d0a')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2'   # Daniel Stenberg
              '914C533DF9B2ADA2204F586D78E11C6B279D5C91')  # Daniel Stenberg

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
