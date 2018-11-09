# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-common
pkgver=3.18.0
pkgrel=3
pkgdesc="Common development macros for GNOME"
arch=(any)
depends=(sh autoconf-archive intltool yelp-tools gtk-doc)
license=(GPL)
url="https://www.gnome.org"
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('22569e370ae755e04527b76328befc4c73b62bfd4a572499fde116b8318af8cf')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-autoconf-archive
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
