# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=adwaita-icon-theme
pkgver=40rc
pkgrel=1
pkgdesc="GNOME standard icons"
url="https://gitlab.gnome.org/GNOME/adwaita-icon-theme"
arch=(any)
license=(LGPL3 CCPL:by-sa)
depends=(hicolor-icon-theme gtk-update-icon-cache librsvg)
makedepends=(git gtk3)
_commit=f05866777fb84bdda844804610bc276c20d9efd5  # tags/40.rc^0
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
