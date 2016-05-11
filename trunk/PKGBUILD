# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=adwaita-icon-theme
pkgver=3.20
pkgrel=2
pkgdesc="Adwaita icon theme"
arch=(any)
depends=('hicolor-icon-theme' 'gtk-update-icon-cache' 'librsvg')
makedepends=('intltool' 'icon-naming-utils')
url="http://www.gnome.org"
license=('GPL')
groups=('gnome')
options=('!emptydirs')
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('7a0a887349f340dd644032f89d81264b694c4b006bd51af1c2c368d431e7ae35')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
