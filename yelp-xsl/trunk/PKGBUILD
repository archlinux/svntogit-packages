# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=yelp-xsl
pkgver=41.1
pkgrel=1
pkgdesc="Document transformations from Yelp"
url="https://gitlab.gnome.org/GNOME/yelp-xsl"
arch=(any)
license=(GPL)
makedepends=(itstool git)
_commit=8932d0ed9be6e92bf9d20fef57e0e6cc12812a2f  # tags/41.1^0
source=("git+https://gitlab.gnome.org/GNOME/yelp-xsl.git#commit=$_commit")
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
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
