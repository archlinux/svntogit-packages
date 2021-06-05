# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libogg
pkgver=1.3.5
pkgrel=1
pkgdesc='Ogg bitstream and framing library'
arch=(x86_64)
url=https://www.xiph.org/ogg/
license=(BSD)
depends=(glibc)
makedepends=(
  cmake
  git
  ninja
)
provides=(libogg.so)
source=(git+https://github.com/xiph/ogg.git?signed#tag=65b355cc20171010ecabf245e7b339aeab8ddbb9)
sha256sums=(SKIP)
validpgpkeys=(B7B00AEE1F960EEA0FED66FB9259A8F2D2D44C84) # Ralph Giles <giles@thaumas.net>

pkgver() {
  cd ogg
  git describe --tags | sed 's/^v//'
}

prepare() {
  cd ogg
}

build() {
  cmake -S ogg -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm 644 ogg/COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm 644 ogg/ogg.m4 -t "${pkgdir}"/usr/share/aclocal/
}

# vim: ts=2 sw=2 et:
