# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=yelp-xsl
pkgver=3.30.1
pkgrel=1
pkgdesc="Document transformations from Yelp"
url="https://gitlab.gnome.org/GNOME/yelp-xsl"
arch=(any)
license=(GPL)
makedepends=(intltool libxslt libxml2 itstool git)
_commit=f9c7b5e371122e8c96f90a9b9e9b9e8534e98043  # tags/3.30.1^0
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
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --enable-doc
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
