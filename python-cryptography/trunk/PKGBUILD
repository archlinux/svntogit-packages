# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cryptography
pkgver=3.4.1
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
sha512sums=('929cfceeb9ebfd4f14236678235f10c9de42b8c12750f03f8c52d6ff77d43784dd17acfa2145bce27fd59e346191b05840c7d4f68efcf8648d375c1e6b70ab48')

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
