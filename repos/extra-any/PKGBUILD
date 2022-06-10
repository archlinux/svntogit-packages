# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-trove-classifiers
pkgver=2022.5.19
pkgrel=1
pkgdesc="Canonical source for classifiers on PyPI (pypi.org)"
url="https://github.com/pypa/trove-classifiers"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-calver' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/pypa/trove-classifiers/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('38e8e26cbe2b83c6b4cd8ce2494c89fb6e74f4a80a395c2c1dc4b5b5dc0f42aee803b925606c6c36eb9be97d78121fc2eedb0bbf9d1816cbfb7b61b21165af57')

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
