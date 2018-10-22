# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libsoup
pkgver=2.64.2
pkgrel=1
pkgdesc="HTTP client/server library for GNOME"
url="https://wiki.gnome.org/Projects/libsoup"
arch=(x86_64)
license=(LGPL)
depends=(glib2 libxml2 glib-networking sqlite krb5 libpsl)
makedepends=(gobject-introspection python vala git gtk-doc meson)
checkdepends=(apache php-apache)
_commit=b25faf59f1bb782e95be94f70a98a369846d1524  # tags/2.64.2^0
source=("git+https://gitlab.gnome.org/GNOME/libsoup.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build -D doc=true -D vapi=true
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
