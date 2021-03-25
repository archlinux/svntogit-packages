# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lightsoff
pkgver=40.0.1
pkgrel=1
pkgdesc="Turn off all the lights"
url="https://wiki.gnome.org/Apps/Lightsoff"
arch=(x86_64)
license=(GPL)
depends=(gtk3 librsvg)
makedepends=(yelp-tools vala git meson)
groups=(gnome-extra)
_commit=ca05a49ff447a6d7fdfadd1921288e2d720f5c09  # tags/40.0.1^0
source=("git+https://gitlab.gnome.org/GNOME/lightsoff.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
