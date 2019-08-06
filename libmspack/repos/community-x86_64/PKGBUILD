# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>

pkgname=libmspack
pkgver=0.10.1alpha
pkgrel=1
epoch=1
pkgdesc='A library for Microsoft compression formats'
url='https://www.cabextract.org.uk/libmspack/'
arch=('x86_64')
license=('GPL')
depends=('glibc')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kyz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bd8537b04ebd2149819ce867e3eba50f862a8a0043fd2061360b4101eddaa382')

build() {
  cd $pkgname-${pkgver}/$pkgname
  autoreconf -vfi
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd $pkgname-${pkgver}/$pkgname
  make check
}

package() {
  cd $pkgname-${pkgver}/$pkgname
  make DESTDIR="$pkgdir" install
}
