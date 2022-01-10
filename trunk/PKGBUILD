# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-tomli-w
pkgver=1.0.0
pkgrel=3
pkgdesc="A lil' TOML writer"
url=https://github.com/hukkin/tomli-w
license=(MIT)
arch=(any)
depends=(python)
makedepends=(
  git
  python-flit
  python-pip
  python-poetry
)
checkdepends=(
  python-pytest
  python-tomli
)
_tag=19099125f32e7c491603e393263754262b356956
source=(git+https://github.com/hukkin/tomli-w.git#tag=${_tag})
b2sums=(SKIP)

pkgver() {
  cd tomli-w
  git describe --tags
}

build() {
  cd tomli-w
  python -m flit build --format wheel
}

check() {
  cd tomli-w
  python -m pytest
}

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps tomli-w/dist/*.whl
  install -Dm 644 tomli-w/LICENSE -t "${pkgdir}"/usr/share/licenses/python-tomli-w/
}

# vim: ts=2 sw=2 et:
