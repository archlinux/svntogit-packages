# Maintainer: Laurent Carlier <lordheavym@archlinux.org>
# Contributor: Cyano Hao <c@cyano.cn>

pkgname=directx-headers
pkgdesc="DirectX headers for using D3D12"
pkgver=1.606.4
pkgrel=1
arch=('x86_64')
makedepends=('meson')
url="https://github.com/microsoft/DirectX-Headers"
license=('MIT')
source=(directx-headers-${pkgver}.tar.gz::https://github.com/microsoft/DirectX-Headers/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('fa95f9ab7cd6111a4cbff91f5b440bf79b38179403c9eef22438065b8b08d303')

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
