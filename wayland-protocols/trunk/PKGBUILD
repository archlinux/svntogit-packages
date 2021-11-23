# Maintainer: Sébastien Luttringer <seblu@seblu.net>

pkgname=wayland-protocols
pkgver=1.24
pkgrel=1
pkgdesc='Specifications of extended Wayland protocols'
arch=('any')
url='https://wayland.freedesktop.org/'
license=('MIT')
makedepends=('wayland' 'meson' 'ninja')
validpgpkeys=('8307C0A224BABDA1BABD0EB9A6EEEC9E0136164A'  # Jonas Ådahl
              'A66D805F7C9329B4C5D82767CCC4F07FAC641EFF') # Daniel Stone
source=("https://wayland.freedesktop.org/releases/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('bff0d8cffeeceb35159d6f4aa6bab18c807b80642c9d50f66cba52ecf7338bc2'
            'SKIP')

prepare() {
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  meson build $pkgname-$pkgver --buildtype=release --prefix=/usr
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  set -x
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m 644 "$pkgname-$pkgver/COPYING"
}

# vim:set ts=2 sw=2 et:
