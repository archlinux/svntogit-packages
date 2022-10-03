# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=yelp-xsl
pkgver=42.1
pkgrel=1
pkgdesc="Document transformations from Yelp"
url="https://gitlab.gnome.org/GNOME/yelp-xsl"
arch=(any)
license=(GPL)
makedepends=(itstool git)
_commit=1658a8eb59a296d9e7b7116fbc79ca778b702e14  # tags/42.1^0
source=("git+https://gitlab.gnome.org/GNOME/yelp-xsl.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd yelp-xsl
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd yelp-xsl
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd yelp-xsl
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd yelp-xsl
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 sts=-1 et:
