# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=yelp-tools
pkgver=3.32.2
pkgrel=1
pkgdesc="Collection of tools for building and converting documentation"
url="https://gitlab.gnome.org/GNOME/yelp-tools"
arch=(any)
depends=(yelp-xsl libxslt libxml2 itstool docbook-xsl mallard-ducktype)
makedepends=(git)
license=(GPL)
_commit=c8664c3df853f5307ff3c4d939721f340d61f4ba  # tags/3.32.2^0
source=("git+https://gitlab.gnome.org/GNOME/yelp-tools.git#commit=$_commit")
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
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
