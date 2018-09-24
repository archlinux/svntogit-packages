# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libsoup
pkgver=2.64.1
pkgrel=1
pkgdesc="HTTP client/server library for GNOME"
url="https://wiki.gnome.org/Projects/libsoup"
arch=(x86_64)
license=(LGPL)
depends=(glib2 libxml2 glib-networking sqlite krb5 libpsl)
makedepends=(gobject-introspection python vala git gtk-doc meson)
checkdepends=(apache php-apache)
_commit=d5b35ec84c80db74419fe369b893560ec3383235  # tags/2.64.1^0
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
