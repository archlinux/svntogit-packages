# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cryptography
pkgver=38.0.1
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
sha512sums=('a0e9eb645888a74e01377c0ed79427d066a50d10a9b628828195e82b7ee44ff59866f3659f2028541856bba818340c404e00061645c2676bc63f8ece42fd511e')

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
