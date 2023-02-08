# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cryptography
pkgver=39.0.1
_commit=d6951dca25de45abd52da51b608055371fbcde4e
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
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-310:$PWD/vectors" pytest
}

package() {
  cd cryptography
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
