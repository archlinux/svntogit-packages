# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-devel-docs
pkgver=40.3
pkgrel=1
pkgdesc="Developer documentation for GNOME"
url="https://gitlab.gnome.org/GNOME/gnome-devel-docs"
arch=(any)
license=(FDL)
depends=(yelp)
makedepends=(yelp-tools git)
groups=(gnome-extra)
_commit=6032dcd16a893c9e6463af9a3b0f0e505d0ce1ce  # tags/40.3^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-devel-docs.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  autoreconf -fvi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
