# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-tomli-w
pkgver=0.4.0
pkgrel=2
pkgdesc="A lil' TOML writer"
url=https://github.com/hukkin/tomli-w
license=(MIT)
arch=(any)
depends=(python)
makedepends=(
  git
  python-dephell
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

prepare() {
  cd tomli-w
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd tomli-w
  python setup.py build
}

check() {
  cd tomli-w
  python -m pytest
}

package() {
  cd tomli-w
  python setup.py install --root="${pkgdir}" -O1
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-tomli-w/
}

# vim: ts=2 sw=2 et:
