# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=cantarell-fonts
pkgver=0.303.1
pkgrel=1
epoch=1
pkgdesc="Humanist sans serif font"
url="https://gitlab.gnome.org/GNOME/cantarell-fonts"
arch=(any)
license=(custom:SIL)
makedepends=(meson appstream-glib git)
source=("https://download.gnome.org/sources/$pkgname/${pkgver:0:5}/$pkgname-$pkgver.tar.xz")
sha256sums=('f9463a0659c63e57e381fdd753cf1929225395c5b49135989424761830530411')

build() {
  arch-meson $pkgname-$pkgver build -D useprebuilt=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgname-$pkgver/COPYING
}

# vim:set sw=2 et:
