# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgbase=python-cffi
pkgname=(python-cffi python2-cffi)
pkgver=1.12.0
pkgrel=1
pkgdesc="Foreign Function Interface for Python calling C code"
arch=('x86_64')
url="http://cffi.readthedocs.org/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pycparser' 'python2-pycparser')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://bitbucket.org/cffi/cffi/get/v$pkgver.tar.gz")
sha512sums=('020d00eccc0e1bbcb3b6fc4b9d682e6a733f83aef146bf52f63f0c391e110037e5b182aba590925d14f51afe7e459af1e66bd7dadf6a2c4531db31e2d1b95ffd')

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
