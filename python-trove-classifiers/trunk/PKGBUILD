# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-trove-classifiers
pkgver=2022.8.31
pkgrel=1
pkgdesc="Canonical source for classifiers on PyPI (pypi.org)"
url="https://github.com/pypa/trove-classifiers"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-calver' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/pypa/trove-classifiers/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('bce304ca9d4b4b7a40272e69f4805de9798987baee2c14983fc809daa32b6c06479d1e24c64599228f3c6f3fa79709a2fee9b6661fdbcb40d539689e4fdd1595')

prepare() {
  cd trove-classifiers-$pkgver
  echo "Version: $pkgver" > PKG-INFO
}

build() {
  cd trove-classifiers-$pkgver
  python setup.py build
}

check() {
  cd trove-classifiers-$pkgver
  pytest
  PYTHONPATH="$PWD"/build/lib python -m tests.lib
}

package() {
  cd trove-classifiers-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
