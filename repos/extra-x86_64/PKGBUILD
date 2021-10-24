# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libsoup
pkgver=2.74.1
pkgrel=1
pkgdesc="HTTP client/server library for GNOME"
url="https://wiki.gnome.org/Projects/libsoup"
arch=(x86_64)
license=(LGPL)
depends=(glib2 libxml2 glib-networking sqlite krb5 libpsl brotli)
makedepends=(gobject-introspection python vala git gtk-doc meson samba)
checkdepends=(apache php-apache)
optdepends=('samba: Windows Domain SSO')
_commit=0e1d3eee74cc568aa077b3472e7fcd3f13d42007  # tags/2.74.1^0
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
  meson test -C build --print-errorlogs
}

package() {
  depends+=(libg{lib,object,io}-2.0.so libgssapi_krb5.so libpsl.so
            libbrotlidec.so)
  provides+=(libsoup{,-gnome}-2.4.so)

  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 et:
