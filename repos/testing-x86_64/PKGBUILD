# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cryptography
pkgver=3.4.6
pkgrel=1
pkgdesc="A package designed to expose cryptographic recipes and primitives to Python developers"
arch=('x86_64')
license=('Apache')
url="https://pypi.python.org/pypi/cryptography"
depends=('python-cffi')
makedepends=('python-setuptools-rust')
checkdepends=('python-pytest-runner' 'python-pytest-subtests' "python-cryptography-vectors=$pkgver"
              'python-iso8601' 'python-pretend' 'python-hypothesis' 'python-pytz')
source=("https://pypi.io/packages/source/c/cryptography/cryptography-$pkgver.tar.gz")
sha512sums=('30b712adc5cc114faeb7bfef0b9de88c6daefa5a8b99e53bd6d37b8ed560bd1d396cbb202902c307b90f40d695bde151164436bf233fb726dc836c8b70126653')

prepare() {
  # https://github.com/pyca/cryptography/pull/5777
  sed -i '/install_requires/d' cryptography-$pkgver/setup.py
}

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
