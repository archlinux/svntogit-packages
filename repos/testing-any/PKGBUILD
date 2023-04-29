# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-packaging
pkgver=23.0
pkgrel=3
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-pretend')
source=("https://github.com/pypa/packaging/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5dd2f4a596e5a1ed01b461a37e063573f5ae08e181df40377a167fe2483205b3d965e10dc403cd173d0f87e0bdcae3cde05bd39024783fbe44541d0f777d94de')

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
