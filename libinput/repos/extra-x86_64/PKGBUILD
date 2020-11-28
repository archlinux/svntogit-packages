# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot

pkgname=libinput
pkgver=1.16.4
pkgrel=1
pkgdesc="Input device management and event handling library"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
# upstream doesn't recommend building docs
makedepends=('gtk3' 'meson') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure')
source=(https://freedesktop.org/software/$pkgname/$pkgname-$pkgver.tar.xz{,.sig})
sha512sums=('a95a3bcf58a9298946d15f4f2fd93dc5807d3042f8797950a1ffd96d3c979b55a764f035a9f7680d0ea400b033698c322eb61a4387dbc280db6110ffd3e137ee'
            'SKIP')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

build() {
  arch-meson $pkgname-$pkgver build \
    -Dudev-dir=/usr/lib/udev \
    -Dtests=false \
    -Ddocumentation=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dvm644 $pkgname-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
