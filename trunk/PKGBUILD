# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=yelp-xsl
pkgver=3.36.0
pkgrel=1
pkgdesc="Document transformations from Yelp"
url="https://gitlab.gnome.org/GNOME/yelp-xsl"
arch=(any)
license=(GPL)
makedepends=(itstool git)
_commit=ba2accef7cc3f1157bf7ece5add1450f6a6f3001  # tags/3.36.0^0
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
