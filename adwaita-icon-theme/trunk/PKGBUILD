# $Id: PKGBUILD 214086 2014-06-03 12:25:52Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=adwaita-icon-theme
pkgver=3.13.91
pkgrel=1
pkgdesc="Adwaita icon theme"
arch=(any)
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
makedepends=('intltool' 'icon-naming-utils')
url="http://www.gnome.org"
license=('GPL')
groups=('gnome')
install=adwaita-icon-theme.install
options=('!emptydirs')
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('d0cf4705d3439c68d344431b62cca5fe6fcf91bd38c745c48b2476d0aa41b8ad')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
