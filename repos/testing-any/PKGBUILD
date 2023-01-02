# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-packaging
pkgver=22.0
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-pretend')
source=("https://github.com/pypa/packaging/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2189dec11dd9fd78a6d816bda08f881e5aa54fde09d51450ceb460a37ba87231fcfdb5ad4f58d262face44dfb0f1c4b420f759491008f8c26cef7e8317c414a8')

build() {
  cd packaging-$pkgver
  python -m build -nw
}

check() {
  cd packaging-$pkgver
  python -m pytest
}

package() {
  cd packaging-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
