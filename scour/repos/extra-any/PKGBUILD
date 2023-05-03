# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=scour
pkgver=0.38.2
pkgrel=3
pkgdesc='An SVG scrubber'
arch=(any)
url=https://github.com/scour-project/scour
license=(Apache)
depends=(
  python-six
)
makedepends=(
  git
  python-setuptools
)
_tag=04bf3d79a0db6b60cf9e226a8cdb96fc216cd71f
source=(git+https://github.com/scour-project/scour.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd scour

  git describe --tags | sed -r 's/^v//; s/^0([0-9])/0.\1/'
}

build() {
  cd scour
  python setup.py build
}

package() {
  cd scour
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
