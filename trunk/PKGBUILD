# Maintainer: Tom Gundersen <teg@jklm.no>
# Maintainer: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgbase=wayland
pkgname=(wayland wayland-docs)
pkgver=1.16.0
pkgrel=1
pkgdesc='A computer display server protocol'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('glibc' 'libffi' 'expat' 'libxml2')
makedepends=('libxslt' 'doxygen' 'xmlto' 'graphviz' 'docbook-xsl')
validpgpkeys=('C7223EBE4EF66513B892598911A30156E0E67611'  # Bryce Harrington
              'C0066D7DB8E9AC6844D728715E54498E697F11D7') # Derek Foreman
source=("https://wayland.freedesktop.org/releases/$pkgbase-$pkgver.tar.xz"{,.sig})
sha1sums=('24c63a5045c653dcfa24efd10fa7c7de89aca9ef'
          'SKIP')

prepare() {
  cd $pkgbase-$pkgver
}

build() {
  cd $pkgbase-$pkgver

  ./configure \
    --prefix=/usr \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgbase-$pkgver

  make check
}

package_wayland() {
  cd $pkgbase-$pkgver

  make DESTDIR="$pkgdir" install

  mkdir -p "$srcdir/docs/share"
  mv "$pkgdir"/usr/share/{doc,man} "$srcdir/docs/share"

  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_wayland-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  cd $pkgbase-$pkgver

  mv "$srcdir/docs" "$pkgdir/usr"

  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
