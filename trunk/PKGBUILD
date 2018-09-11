# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgbase=python-cffi
pkgname=(python-cffi python2-cffi)
pkgver=1.11.5
pkgrel=2
pkgdesc="Foreign Function Interface for Python calling C code"
arch=('x86_64')
url="http://cffi.readthedocs.org/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pycparser' 'python2-pycparser')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://bitbucket.org/cffi/cffi/get/v$pkgver.tar.gz")
sha512sums=('f2f485aa8c541f82a0caef41ef48f7c0b3432208588e4748463fd7ceffb762c645751d66e910b7d56b22cc51a2e99305a626de4abc2f2fae13c6a58009d41651')

prepare() {
  mv cffi-cffi-* cffi-$pkgver
  cp -a cffi-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/cffi-$pkgver
  python setup.py build

  cd "$srcdir"/cffi-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/cffi-$pkgver
  python setup.py pytest

  cd "$srcdir"/cffi-$pkgver-py2
  python2 setup.py pytest
}

package_python-cffi() {
  depends=('python-pycparser')

  cd cffi-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-cffi() {
  depends=('python2-pycparser')

  cd cffi-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
