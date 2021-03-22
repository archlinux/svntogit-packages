# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libsoup
pkgver=2.72.0+10+gfe1e295d
pkgrel=1
pkgdesc="HTTP client/server library for GNOME"
url="https://wiki.gnome.org/Projects/libsoup"
arch=(x86_64)
license=(LGPL)
depends=(glib2 libxml2 glib-networking sqlite krb5 libpsl brotli)
makedepends=(gobject-introspection python vala git gtk-doc meson samba)
checkdepends=(apache php-apache)
optdepends=('samba: Windows Domain SSO')
provides=(libsoup-2.4.so libsoup-gnome-2.4.so)
_commit=fe1e295d86924ba291dbd3d24904ec47fd945eb6  # gnome-3-38
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
  arch-meson $pkgname build \
    -D gtk_doc=true \
    -D sysprof=disabled
  meson compile -C build
}

check() {
  # SSL test flaky
  # https://gitlab.gnome.org/GNOME/libsoup/-/issues/188
  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
