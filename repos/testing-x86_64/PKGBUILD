# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=mpfr
pkgver=4.1.0
pkgrel=2
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64)
url='https://www.mpfr.org/'
license=('GPL3' 'LGPL3')
depends=('glibc' 'gmp')
makedepends=('autoconf-archive')
source=("https://ftp.gnu.org/gnu/mpfr/mpfr-${pkgver}.tar.xz"{,.sig})
sha512sums=('1bd1c349741a6529dfa53af4f0da8d49254b164ece8a46928cdb13a99460285622d57fe6f68cef19c6727b3f9daa25ddb3d7d65c201c8f387e421c7f7bee6273'
            'SKIP')
b2sums=('41d1be0c4b557760f12a4525ad3a84b6e2cd6f0927c935fcfba577ac0490e582d1ae4b581dce58e21e705cf9d7c88373054d7fb7a94bb32c69b339f99a25dc68'
        'SKIP')
# NOTE: key holder contacted about unsafe key (2021-05-03)
validpgpkeys=('07F3DBBECC1A39605078094D980C197698C3739D') # Vincent Lefevre <vincent@vinc17.net>

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -fiv
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
    --enable-thread-safe \
    --enable-shared
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
  make check-exported-symbols
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
