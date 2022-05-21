# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=mtdev
pkgver=1.1.6
pkgrel=2
pkgdesc="A stand-alone library which transforms all variants of kernel MT events to the slotted type B protocol"
arch=('x86_64')
url="https://bitmath.org/code/mtdev/"
license=('custom:MIT')
depends=('glibc')
source=("$url$pkgname-$pkgver.tar.bz2")
sha512sums=('859fb0803f330ecaae69f80713ff5a5235c0cb00de6d5ac2717ad82cea856a92b866f0c272ecfe743186abcf925f95585149ba4828b4c91555cfeb2f2a1c98f1')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
