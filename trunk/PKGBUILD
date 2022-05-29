# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cryptography
pkgver=37.0.1
pkgrel=1
pkgdesc="A package designed to expose cryptographic recipes and primitives to Python developers"
arch=('x86_64')
license=('Apache')
url="https://pypi.python.org/pypi/cryptography"
depends=('python-cffi')
makedepends=('python-setuptools-rust')
checkdepends=('python-pytest-runner' 'python-pytest-subtests' "python-cryptography-vectors=$pkgver"
              'python-iso8601' 'python-pretend' 'python-hypothesis' 'python-pytz'
              'python-pytest-benchmark')
source=("https://pypi.io/packages/source/c/cryptography/cryptography-$pkgver.tar.gz")
sha512sums=('751029ecfb911e70cd402f7bf1573ec6b4e1dd98bed27723e8c48e918cb417b2327af84f173dd21c986fe1d39a5721df38ccaa37f8b5ed569290c66c5e42f34a')

build() {
  cd cryptography-$pkgver
  python setup.py build
}

check() {
  cd cryptography-$pkgver
  python setup.py pytest
}

package() {
  cd cryptography-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
