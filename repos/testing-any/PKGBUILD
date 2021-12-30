# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-packaging
pkgver=21.0
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
depends=('python-pyparsing')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pretend')
source=("https://github.com/pypa/packaging/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('612744ad8d0b834709af5d4e2415679271e4cdc304a2e9297ec741e37e62241a041b678568130cd733828a1bf2e5885d62de706934f4018195566107989a6f6b')

build() {
  cd packaging-$pkgver
  python setup.py build
}

check() {
  cd packaging-$pkgver
  python -m pytest
}

package() {
  cd packaging-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
