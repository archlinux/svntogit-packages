# Maintainer: Laurent Carlier <lordheavym@archlinux.org>
# Contributor: Cyano Hao <c@cyano.cn>

pkgname=directx-headers
pkgdesc="DirectX headers for using D3D12"
pkgver=1.608.2
pkgrel=1
arch=('x86_64')
makedepends=('meson')
url="https://github.com/microsoft/DirectX-Headers"
license=('MIT')
source=(directx-headers-${pkgver}.tar.gz::https://github.com/microsoft/DirectX-Headers/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('6d2b2ee19e744ce5e0e9716367ad38ebf94dd5ef18a014971594f29eb67bd87e')

build() {
  # LTO breaks mesa...
  export CXXFLAGS="$CXXFLAGS -fno-lto"

  arch-meson DirectX-Headers-$pkgver build \
    -Dbuild-test=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" DirectX-Headers-$pkgver/LICENSE
}
