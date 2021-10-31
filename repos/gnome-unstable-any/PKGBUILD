# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=adwaita-icon-theme
pkgver=41.0
pkgrel=1
pkgdesc="GNOME standard icons"
url="https://gitlab.gnome.org/GNOME/adwaita-icon-theme"
arch=(any)
license=(LGPL3 CCPL:by-sa)
depends=(hicolor-icon-theme gtk-update-icon-cache librsvg)
makedepends=(git gtk3)
_commit=8670d0eb2414c1ac16d927da5d1a22142ba5e346  # tags/41.0^0
source=("git+https://gitlab.gnome.org/GNOME/adwaita-icon-theme.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/\.rc/rc/;s/-/+/g'
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

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
