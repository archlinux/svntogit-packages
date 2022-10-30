# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=yelp-tools
pkgver=42.1
pkgrel=1
pkgdesc="Collection of tools for building and converting documentation"
url="https://gitlab.gnome.org/GNOME/yelp-tools"
arch=(any)
depends=(yelp-xsl python-lxml itstool libxml2 docbook-xsl mallard-ducktype)
makedepends=(git meson)
license=(GPL)
_commit=fe5ff72ca46fba425143e5dc67d660703c86145f  # tags/42.1^0
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
