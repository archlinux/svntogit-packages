# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot

pkgname=libinput
pkgver=1.19.3
pkgrel=2
pkgdesc="Input device management and event handling library"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
# upstream doesn't recommend building docs
makedepends=('gtk3' 'meson' 'wayland-protocols') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure')
source=(https://freedesktop.org/software/$pkgname/$pkgname-$pkgver.tar.xz{,.sig})
sha512sums=('f4b776d0da78c687ba21b430a04941ac6b43f68970c82ec9f7360358fdea5ed6a873948ce66a25bcdd64d4b95fa4bf705cc24dbc25c7c0f5fd2d0efbd763f298'
            'SKIP')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

build() {
  arch-meson $pkgname-$pkgver build \
    -D b_lto=false \
    -D udev-dir=/usr/lib/udev \
    -D tests=false \
    -D documentation=false
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  install -Dvm644 $pkgname-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
