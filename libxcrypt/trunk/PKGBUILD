# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=libxcrypt
pkgname=(libxcrypt libxcrypt-compat)
pkgver=4.4.31
pkgrel=1
pkgdesc='Modern library for one-way hashing of passwords'
arch=('x86_64')
url='https://github.com/besser82/libxcrypt/'
license=('GPL')
depends=('glibc')
provides=('libcrypt.so')
options=('debug')
install=libxcrypt.install
validpgpkeys=('678CE3FEE430311596DB8C16F52E98007594C21D') # Björn 'besser82' Esser
source=("${url}/releases/download/v${pkgver}/${pkgbase}-${pkgver}.tar.xz"{,.asc})
sha256sums=('c0181b6a8eea83850cfe7783119bf71fddbde69adddda1d15747ba433d5c57ba'
            'SKIP')

build() {
  mkdir build-libxcrypt build-libxcrypt-compat

  cd "${srcdir}/build-libxcrypt/"
  "${srcdir}/${pkgbase}-${pkgver}"/configure \
    --prefix=/usr \
    --disable-static \
    --enable-hashes=strong,glibc \
    --enable-obsolete-api=no \
    --disable-failure-tokens
  make
  
  cd "${srcdir}/build-libxcrypt-compat/"
  "${srcdir}/${pkgbase}-${pkgver}"/configure \
    --prefix=/usr \
    --disable-static \
    --enable-hashes=strong,glibc \
    --enable-obsolete-api=glibc \
    --disable-failure-tokens
  make
}

check() {
  cd build-libxcrypt/

  make check 
}

package_libxcrypt() {
  cd build-libxcrypt/

  make DESTDIR="${pkgdir}" install
}

package_libxcrypt-compat() {
  pkgdesc='Modern library for one-way hashing of passwords - legacy API functions'
  depends=('libxcrypt')
  
  cd build-libxcrypt-compat/

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,lib/{lib*.so,pkgconfig},share}
}
