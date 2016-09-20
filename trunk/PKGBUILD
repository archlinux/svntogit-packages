# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=adwaita-icon-theme
pkgver=3.21.2+17+ge562774
pkgrel=1
pkgdesc="Adwaita icon theme"
arch=(any)
depends=('hicolor-icon-theme' 'gtk-update-icon-cache' 'librsvg')
makedepends=('intltool' 'gnome-common' 'git' 'gtk3')
url="http://www.gnome.org"
license=('GPL')
groups=('gnome')
options=('!emptydirs')
_commit=e562774e7d7a43ca4baaf6af47a2a2fc001f1db6
source=("git://git.gnome.org/adwaita-icon-theme#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}
  
build() {
    cd $pkgname
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname
    make DESTDIR="$pkgdir" install
}
