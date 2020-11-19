# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=c-ares
pkgver=1.17.1
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=('x86_64')
url="https://c-ares.haxx.se/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=('libcares.so')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgname//-}-${pkgver//./_}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha512sums=('b11887bcc9274d368088e1a8b6aca62414f20675cf0bc58e948f54fa04c327c39dd23cefe7509eec6397db14b550a3f6b77f5c18b3d735b3eef48ce2da1dcd00'
            'SKIP')
b2sums=('31dac21ecae231e2a201dc1ba954c1a0663a06f93eb8e7e033ca3c6d385f53e07af0b04854739f1ee8a7f0693f67f620143e152ef092b49342c62279a0480905'
        'SKIP')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg <daniel@haxx.se>

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -Wno-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install -C build
  install -vDm 644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 {AUTHORS,CHANGES,{CONTRIBUTING,README}.md,RELEASE-NOTES} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
