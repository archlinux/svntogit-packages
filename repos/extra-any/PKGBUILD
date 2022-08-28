# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-trove-classifiers
pkgver=2022.8.24
pkgrel=1
pkgdesc="Canonical source for classifiers on PyPI (pypi.org)"
url="https://github.com/pypa/trove-classifiers"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-calver' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/pypa/trove-classifiers/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a668835fe29e2a5052b531e8dba0003366793dd23ba5337a612e8f6242c519434c18c45101b0d7f397c2c6d07e2f965fe82f90bd9735266f3e86f07b8180cc93')

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
