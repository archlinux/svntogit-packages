# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cryptography
pkgver=37.0.2
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
sha512sums=('28d8b52ca457dec0c854ffb798c9ecb4316c3f161ece5c304c7a5e0cdc86e8b567f1cea82f96f23b01af611e04f48fa310c0e78b3175f4b06e9175acc6a2de45')

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
