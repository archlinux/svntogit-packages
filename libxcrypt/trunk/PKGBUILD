# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libxcrypt
pkgver=4.4.26
pkgrel=1
pkgdesc='Modern library for one-way hashing of passwords'
arch=('x86_64')
url='https://github.com/besser82/libxcrypt/'
license=('GPL')
depends=('glibc')
provides=('libcrypt.so')
install=libxcrypt.install
validpgpkeys=('678CE3FEE430311596DB8C16F52E98007594C21D') # Björn 'besser82' Esser
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('8e6ab1e22b9d1dc40165ec767662a34773d22f766aae1f989328069e8a3aa99a'
            'SKIP')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --disable-static \
    --enable-hashes=strong,glibc \
    --enable-obsolete-api=no \
    --disable-failure-tokens
  make
}

check() {
  cd "${pkgname}-${pkgver}"

  make check 
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
