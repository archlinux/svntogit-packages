# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=yelp-xsl
pkgver=41.0
pkgrel=1
pkgdesc="Document transformations from Yelp"
url="https://gitlab.gnome.org/GNOME/yelp-xsl"
arch=(any)
license=(GPL)
makedepends=(itstool git)
_commit=eb83ce4f0f282b3998e21798b4156536b25752b8  # tags/41.0^0
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
