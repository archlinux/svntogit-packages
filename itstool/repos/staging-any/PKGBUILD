# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Michael Pusterhofer <pusterhofer(at)student(dot)tugraz(dot)at>

pkgname=itstool
pkgver=2.0.6
pkgrel=2
epoch=1
pkgdesc="XML to PO and back again"
arch=(any)
url="http://itstool.org/"
license=(GPL3)
depends=(python libxml2 docbook-xml)
makedepends=(git)
_commit=60f3a955ca047b1d62a1d952beec74afaff7cbbf  # tags/2.0.6^0
source=("git+https://github.com/itstool/itstool#commit=$_commit"
        itstool-2.0.5-fix-crash-wrong-encoding.patch)
sha256sums=('SKIP'
            'cb57e3694ab3d7c62b063629b2e9edc6327260c0797d0f33c8dc97fe37c40ebb')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # From https://src.fedoraproject.org/rpms/libxml2/tree/master
  patch -Np1 -i ../itstool-2.0.5-fix-crash-wrong-encoding.patch

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
