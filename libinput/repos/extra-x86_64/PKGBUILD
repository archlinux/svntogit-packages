# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot

pkgname=libinput
pkgver=1.19.1
pkgrel=1
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
sha512sums=('63084f5e081ee4918fee8584d99e6feb84ce9b771015c556c930843e0097abb9b93b6f9731c488b8493eac18fa4086f4822a2ed00f3cb3258346341ad0061c36'
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
