# Maintainer: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgbase=wayland
pkgname=(wayland wayland-docs)
pkgver=1.19.0
pkgrel=1
pkgdesc='A computer display server protocol'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('glibc' 'libffi' 'expat' 'libxml2')
makedepends=('meson' 'ninja' 'libxslt' 'doxygen' 'xmlto' 'graphviz' 'docbook-xsl')
validpgpkeys=('C7223EBE4EF66513B892598911A30156E0E67611'  # Bryce Harrington
              'C0066D7DB8E9AC6844D728715E54498E697F11D7'  # Derek Foreman
              '34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48') # emersion <contact@emersion.fr>
source=("https://wayland.freedesktop.org/releases/$pkgbase-$pkgver.tar.xz"{,.sig})
sha256sums=('baccd902300d354581cd5ad3cc49daa4921d55fb416a5883e218750fef166d15'
            'SKIP')

build() {
  meson build $pkgbase-$pkgver --buildtype=release --prefix=/usr
  ninja -C build
}

check() {
  ninja -C build test
}

package_wayland() {
  DESTDIR="$pkgdir" ninja -C build install
  mkdir -p docs/share
  mv "$pkgdir"/usr/share/{doc,man} docs/share
  install -Dm 644 $pkgbase-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_wayland-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv docs "$pkgdir/usr"
  install -Dm 644 $pkgbase-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
