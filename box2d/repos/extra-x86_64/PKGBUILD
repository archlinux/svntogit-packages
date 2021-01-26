# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=box2d
pkgver=2.4.1
pkgrel=1
pkgdesc="2D rigid body simulation library for games"
url="http://www.box2d.org/"
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cmake' 'doxygen' 'ninja')
# We're going to this alternate fork until the patches are upstreamed.
# See https://github.com/erincatto/box2d/issues/621
#source=("$pkgname-$pkgver.tar.gz::https://github.com/erincatto/Box2D/archive/v${pkgver}.tar.gz"
source=("$pkgname-$pkgver.tar.gz::https://github.com/erincatto/box2d/archive/v2.4.1.tar.gz")
sha512sums=('d900f925b77906777719c91488bdc5e2df1ad1f4a8ca39a574229f5e57070e3a843bdd7530e817112605fde6d82145c872d8afdfc65b84531a73199098c81162')

build() {
  cd $pkgname-$pkgver

  cmake . \
    -Bbuild \
    -GNinja \
    -DBOX2D_BUILD_DOCS=ON \
    -DBOX2D_BUILD_TESTBED=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja -C build
}

check() {
  cd $pkgname-$pkgver

  build/bin/unit_test
}

package() {
  cd $pkgname-$pkgver

  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/box2d/LICENSE
}

# vim: sw=2 ts=2 et:
