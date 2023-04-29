# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cryptography
pkgver=40.0.2
_commit=f816b457494e010b655cd7fdcd30e3446f86a703
pkgrel=1
pkgdesc="A package designed to expose cryptographic recipes and primitives to Python developers"
arch=('x86_64')
license=('Apache')
url="https://pypi.python.org/pypi/cryptography"
depends=('python-cffi')
makedepends=('git' 'python-setuptools-rust')
checkdepends=('python-pytest' 'python-pytest-subtests' 'python-iso8601' 'python-pretend'
              'python-hypothesis' 'python-pytz' 'python-pytest-benchmark')
source=("git+https://github.com/pyca/cryptography.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd cryptography
  python setup.py build
}

check() {
  cd cryptography
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-311:$PWD/vectors" pytest
}

package() {
  cd cryptography
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
