# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgbase=python-cffi
pkgname=(python-cffi python2-cffi)
pkgver=1.13.1
pkgrel=2
pkgdesc="Foreign Function Interface for Python calling C code"
arch=('x86_64')
url="https://cffi.readthedocs.org/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pycparser' 'python2-pycparser')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://bitbucket.org/cffi/cffi/get/v$pkgver.tar.gz")
sha512sums=('7dd94d91e655af8088d8c14ade9d7085764cea416b255ab9df8da8cc72b8d3880f240bcdf9c9b96109299b3744ed9ca620536b430f5600c1d10605ab2af4296e')

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
