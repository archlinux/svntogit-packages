# Maintainer : Rémy Oudompheng <remy@archlinux.org>

pkgname=pyalpm
pkgver=0.10.6
pkgrel=5
pkgdesc="Python 3 bindings for libalpm"
arch=('x86_64')
url="https://gitlab.archlinux.org/archlinux/pyalpm"
license=('GPL')
makedepends=('git' 'python-setuptools' 'python-pytest' 'python-pkgconfig' 'python-pytest-pacman')
depends=('python' 'pacman')
source=("git+https://gitlab.archlinux.org/archlinux/pyalpm.git#tag=$pkgver")
validpgpkeys=('E499C79F53C96A54E572FEE1C06086337C50773E')
sha512sums=('SKIP')

prepare() {
  cd "${pkgname}"
}

build() {
  cd "${pkgname}"
  python setup.py build
}

check() {
  cd "${pkgname}"
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-311" pytest
}

package() {
  cd "${pkgname}"
  python setup.py install --root=${pkgdir}
}
