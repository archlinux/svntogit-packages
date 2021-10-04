# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=yelp-tools
pkgver=41.0
pkgrel=1
pkgdesc="Collection of tools for building and converting documentation"
url="https://gitlab.gnome.org/GNOME/yelp-tools"
arch=(any)
depends=(yelp-xsl python-lxml itstool libxml2 docbook-xsl mallard-ducktype)
makedepends=(git meson)
license=(GPL)
_commit=6a68991ff8fe7dc1f97dd8479fc44316f0ded89b  # tags/41.0^0
source=("git+https://gitlab.gnome.org/GNOME/yelp-tools.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
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
