# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-trove-classifiers
pkgver=2022.7.22
pkgrel=1
pkgdesc="Canonical source for classifiers on PyPI (pypi.org)"
url="https://github.com/pypa/trove-classifiers"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-calver' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/pypa/trove-classifiers/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7d60a18a7ee11e21021f5ccc131e9ca28769083776898d931dd92131ea7edecd7ecad17a7a9d6d2d11e19ab8ff6a6fc2373ff9938fc26567e0f7c4a0e903d3c1')

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
