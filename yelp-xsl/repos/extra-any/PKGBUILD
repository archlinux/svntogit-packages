# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=yelp-xsl
pkgver=3.32.0
pkgrel=1
pkgdesc="Document transformations from Yelp"
url="https://gitlab.gnome.org/GNOME/yelp-xsl"
arch=(any)
license=(GPL)
makedepends=(intltool libxslt libxml2 itstool git mallard-ducktype)
_commit=4332c3284e4d84b5501eebd72df502ba8883d539  # tags/3.32.0^0
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
  install -Dt "$pkgdir/usr/share/help/C/$pkgname" -m644 doc/yelp-xsl/C/*
}
