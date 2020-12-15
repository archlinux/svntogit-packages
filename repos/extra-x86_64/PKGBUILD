# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=libldac
pkgver=2.0.2.3
pkgrel=1
pkgdesc="LDAC Bluetooth encoder library"
url="https://github.com/EHfive/ldacBT"
arch=(x86_64)
license=(Apache)
depends=(glibc)
makedepends=(git cmake)
provides=(libldacBT_{abr,enc}.so)
_commit=fbffba45d15d959da6ee04eafe14c0d4721f6030  # tags/v2.0.2.3
source=("git+$url#commit=$_commit"
        "git+https://gitlab.com/eh5/libldac.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd ldacBT
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd ldacBT

  git submodule init
  git submodule set-url libldac "$srcdir/libldac"
  git submodule update
}

build() {
  cmake -S ldacBT -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DLDAC_SOFT_FLOAT=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
