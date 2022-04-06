# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo
pkgver=1.17.6
pkgrel=2
pkgdesc="2D graphics library with support for multiple output devices"
url="https://cairographics.org/"
arch=(x86_64)
license=(LGPL MPL)
depends=(lzo zlib libpng fontconfig freetype2 libx11 libxext libxrender libxcb
         glib2 pixman)
makedepends=(valgrind git meson gtk-doc)
options=(debug)
_commit=b43e7c6f3cf7855e16170a06d3a9c7234c60ca94  # tags/1.17.6^0
source=("git+https://gitlab.freedesktop.org/cairo/cairo.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd cairo
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd cairo

  # https://bugs.archlinux.org/task/74354
  git cherry-pick -n ff4fd6f960deb7afdac233465a1f4e807234ad15
}

build() {
  arch-meson cairo build \
    -D spectre=disabled \
    -D tee=enabled \
    -D tests=disabled \
    -D symbol-lookup=disabled \
    -D gtk_doc=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
