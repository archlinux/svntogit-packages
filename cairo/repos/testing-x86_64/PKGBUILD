# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgbase=cairo
pkgname=(cairo cairo-docs)
pkgver=1.17.8
pkgrel=1
pkgdesc="2D graphics library with support for multiple output devices"
url="https://cairographics.org/"
arch=(x86_64)
license=(
  LGPL
  MPL
)
depends=(
  fontconfig
  freetype2
  glib2
  libpng
  libx11
  libxcb
  libxext
  libxrender
  lzo
  pixman
  zlib
)
makedepends=(
  git
  gtk-doc
  meson
  valgrind
)
_commit=c3b672634f0635af1ad0ffa8c15b34fc7c1035cf  # tags/1.17.8^0
source=("git+https://gitlab.freedesktop.org/cairo/cairo.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd cairo
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd cairo
}

build() {
  local meson_options=(
    -D dwrite=disabled
    -D gtk_doc=true
    -D spectre=disabled
    -D symbol-lookup=disabled
    -D tests=disabled
  )

  arch-meson cairo build "${meson_options[@]}"
  meson compile -C build
}

package_cairo() {
  provides=(
    libcairo-gobject.so
    libcairo-script-interpreter.so
    libcairo.so
  )

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/gtk-doc
}

package_cairo-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
