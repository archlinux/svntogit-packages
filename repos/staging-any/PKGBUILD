# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=pyatspi
pkgname=(python-atspi)
pkgver=2.46.0
pkgrel=2
pkgdesc="Python bindings for D-Bus AT-SPI"
url="https://wiki.linuxfoundation.org/accessibility/atk/at-spi/at-spi_on_d-bus"
arch=(any)
license=(GPL2)
depends=(python-gobject at-spi2-core)
makedepends=(git)
_commit=c9cb2a2289a6eb1fb95b66c25d5351bfea54c47e  # tags/PYATSPI_2_46_0^0
source=("git+https://gitlab.gnome.org/GNOME/pyatspi2.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd pyatspi2
  git describe --tags | sed 's/^PYATSPI_//;s/_/./g;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd pyatspi2
  NOCONFIGURE=1 ./autogen.sh
}

build() (
  cd pyatspi2
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --with-python=/usr/bin/python
  make
)

package_python-atspi() {
  cd pyatspi2
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 sts=-1 et:
