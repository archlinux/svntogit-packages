# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-packaging
pkgver=23.1
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-pretend')
source=("https://github.com/pypa/packaging/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1e717a2c97371e177f6b73de8de0440384e7abf361771e68b1696bc8e67d9d0995d2aeb2037995a16ecd374f58317793e66574c9fc28691b4e6094ece69cb5f0')

build() {
  cd packaging-$pkgver
  python -m build -nw
}

check() {
  cd packaging-$pkgver
  PYTHONPATH=src pytest
}

package() {
  cd packaging-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
