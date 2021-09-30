# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libsoup
pkgver=2.74.0
pkgrel=3
pkgdesc="HTTP client/server library for GNOME"
url="https://wiki.gnome.org/Projects/libsoup"
arch=(x86_64)
license=(LGPL)
depends=(glib2 libxml2 glib-networking sqlite krb5 libpsl brotli)
makedepends=(gobject-introspection python vala git gtk-doc meson samba)
checkdepends=(apache php-apache)
optdepends=('samba: Windows Domain SSO')
_commit=63b1d319c6a0d4fde69f074c2fe04ff9767e7684  # tags/2.74.0^0
source=("git+https://gitlab.gnome.org/GNOME/libsoup.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  git cherry-pick -n 80a7e4fb1cdfdb6f460e6fea076d8d5102b1d6e4
}

build() {
  arch-meson $pkgname build \
    -D gtk_doc=true \
    -D sysprof=disabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(libg{lib,object,io}-2.0.so libgssapi_krb5.so libpsl.so
            libbrotlidec.so)
  provides+=(libsoup{,-gnome}-2.4.so)

  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 et:
