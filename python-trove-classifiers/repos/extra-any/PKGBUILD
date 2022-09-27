# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-trove-classifiers
pkgver=2022.9.26
pkgrel=1
pkgdesc="Canonical source for classifiers on PyPI (pypi.org)"
url="https://github.com/pypa/trove-classifiers"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-calver' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/pypa/trove-classifiers/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('32fc05d993adb7c6056153c9250fcae519aae47f9b7b38a41c4bfec2f304d4bd1a7655d709ea387b887ec6a5a33b31b8dfa6edb112fb91453f8d4831d16baf98')

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
