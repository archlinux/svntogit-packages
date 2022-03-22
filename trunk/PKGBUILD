# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=yelp-tools
pkgver=42.0
pkgrel=1
pkgdesc="Collection of tools for building and converting documentation"
url="https://gitlab.gnome.org/GNOME/yelp-tools"
arch=(any)
depends=(yelp-xsl python-lxml itstool libxml2 docbook-xsl mallard-ducktype)
makedepends=(git meson)
license=(GPL)
_commit=dfa2d6ea142c73c20024cc3a3cefdaa4706268af  # tags/42.0^0
source=("git+https://gitlab.gnome.org/GNOME/yelp-tools.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build -D help=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
