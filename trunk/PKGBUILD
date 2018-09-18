# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot

pkgname=libinput
pkgver=1.12.0
pkgrel=2
pkgdesc="Input device management and event handling library"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
# upstream doesn't recommend building docs
makedepends=('gtk3' 'meson') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-evdev: libinput measure')
source=(https://freedesktop.org/software/$pkgname/$pkgname-$pkgver.tar.xz{,.sig}
       0001_Elan_Touchpads_quirks.patch)
sha512sums=('4aee877785f9ac080e4f8ee20f3643bc4f3ddbc568aca6c363a962f8c8f76b8db7dc113c8167092f0277d112346a85b9a7e7c3c3f227ed243aaba32c9092c924'
            'SKIP'
            '8d603a04e1ef737f8627d75d2da97d5cee7607e2604a31105496a6ea2db632d40d04a567ce22ac2cd4765a2fd1ec4945032bad0b8c3b9ed4a9bd333886976570')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
  cd $srcdir/$pkgname-$pkgver
  # FS#60072
  patch -Np1 -i ../0001_Elan_Touchpads_quirks.patch
}

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
