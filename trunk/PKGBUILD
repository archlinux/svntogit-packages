# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-tomli-w
pkgver=0.4.0
pkgrel=1
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
_tag=22874ff44581f34810e6f19fb6f682ca39fe0fce
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
