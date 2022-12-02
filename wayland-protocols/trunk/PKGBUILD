# Maintainer: Sébastien Luttringer <seblu@seblu.net>

pkgname=wayland-protocols
pkgver=1.31
pkgrel=1
pkgdesc='Specifications of extended Wayland protocols'
arch=('any')
url='https://wayland.freedesktop.org/'
license=('MIT')
makedepends=('wayland' 'meson' 'ninja')
validpgpkeys=('8307C0A224BABDA1BABD0EB9A6EEEC9E0136164A'  # Jonas Ådahl
              'A66D805F7C9329B4C5D82767CCC4F07FAC641EFF') # Daniel Stone
source=("https://gitlab.freedesktop.org/wayland/$pkgname/-/releases/$pkgver/downloads/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('a07fa722ed87676ec020d867714bc9a2f24c464da73912f39706eeef5219e238'
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
