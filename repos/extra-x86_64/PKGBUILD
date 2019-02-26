# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgbase=python-cffi
pkgname=(python-cffi python2-cffi)
pkgver=1.12.2
pkgrel=1
pkgdesc="Foreign Function Interface for Python calling C code"
arch=('x86_64')
url="http://cffi.readthedocs.org/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pycparser' 'python2-pycparser')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://bitbucket.org/cffi/cffi/get/v$pkgver.tar.gz")
sha512sums=('26506e8ad01c443a6046af8e2b79f23c92138c5d1d642a2b54f4a15753f9632a260ecfc2e24ddf06ad0c259c969756222e8efbb7154dda39075b99e33822b2c8')

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
