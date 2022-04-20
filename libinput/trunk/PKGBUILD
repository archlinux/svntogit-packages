# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=libinput
pkgver=1.20.1
pkgrel=1
pkgdesc="Input device management and event handling library"
url="https://gitlab.freedesktop.org/libinput"
arch=(x86_64)
license=(custom:X11)
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
# upstream doesn't recommend building docs
makedepends=('gtk4' 'meson' 'wayland-protocols' 'check') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
optdepends=('gtk4: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure')
options=(debug)
source=(https://gitlab.freedesktop.org/libinput/libinput/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha512sums=('d981bf90980c2f609393da998926bc4018599dddbb86c272dfb77bab1b2d5f35c6070f96bcfe5ef0032bd6c957b13f64ed32025d9f04fb413268571b2ee79cd1')
#source=(https://freedesktop.org/software/$pkgname/$pkgname-$pkgver.tar.xz{,.sig})
#sha512sums=('f4b776d0da78c687ba21b430a04941ac6b43f68970c82ec9f7360358fdea5ed6a873948ce66a25bcdd64d4b95fa4bf705cc24dbc25c7c0f5fd2d0efbd763f298'
#            'SKIP')
#validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

build() {
  arch-meson $pkgname-$pkgver build \
    -D udev-dir=/usr/lib/udev \
    -D documentation=false

  # Print config
  meson configure build

  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dvm644 $pkgname-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
