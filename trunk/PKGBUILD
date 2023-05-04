# Maintainer: Laurent Carlier <lordheavym@archlinux.org>
# Contributor: Cyano Hao <c@cyano.cn>

pkgname=directx-headers
pkgdesc="DirectX headers for using D3D12"
pkgver=1.610.0
pkgrel=1
arch=('x86_64')
makedepends=('meson')
url="https://github.com/microsoft/DirectX-Headers"
license=('MIT')
source=(directx-headers-${pkgver}.tar.gz::https://github.com/microsoft/DirectX-Headers/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('343b04a8206c4169a1feab99a7bd29ecb0c8f511988e9a007fea51768bda14fa')

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
