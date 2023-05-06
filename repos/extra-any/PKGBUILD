# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=adwaita-icon-theme
pkgname=(adwaita-icon-theme adwaita-cursors)
pkgver=44.0
pkgrel=1
pkgdesc="GNOME standard icons"
url="https://gitlab.gnome.org/GNOME/adwaita-icon-theme"
arch=(any)
license=(
  CCPL:by-sa
  LGPL3
)
depends=(
  hicolor-icon-theme
  gtk-update-icon-cache
  librsvg
)
makedepends=(
  git
  gtk3
)
_commit=a5a52e09d26ccbb28e60a253e5b6e7eb18247e16  # tags/44.0^0
source=("git+https://gitlab.gnome.org/GNOME/adwaita-icon-theme.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
  autoreconf -fvi
}
  
build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname
  make check
}

package_adwaita-icon-theme() {
  depends+=(adwaita-cursors)

  make -C $pkgname DESTDIR="$pkgdir" install

  mkdir -p cursors/usr/share/icons/Adwaita
  mv {"$pkgdir",cursors}/usr/share/icons/Adwaita/cursors
}

package_adwaita-cursors() {
  pkgdesc="GNOME standard cursors"
  depends=()

  mv cursors/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
