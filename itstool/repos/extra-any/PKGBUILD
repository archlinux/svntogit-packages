# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer(at)student(dot)tugraz(dot)at>

pkgname=itstool
pkgver=2.0.7
pkgrel=1
epoch=1
pkgdesc="XML to PO and back again"
arch=(any)
url="http://itstool.org/"
license=(GPL3)
depends=(python libxml2 docbook-xml)
makedepends=(git)
_commit=f1c6544dcd83a73a5ccea9e0c48cf9a47e006190  # tags/2.0.7^0
source=("git+https://github.com/itstool/itstool#commit=$_commit"
        0001-Fix-the-crash-from-912099.patch)
sha256sums=('SKIP'
            'b43cea38118aaefa6724136d142dcc7099cd6de04cf2e226f53d4310dfe207cc')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # https://src.fedoraproject.org/rpms/itstool/blob/rawhide/f/itstool-2.0.5-fix-crash-wrong-encoding.patch
  git apply -3 ../0001-Fix-the-crash-from-912099.patch

  autoreconf -fvi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
