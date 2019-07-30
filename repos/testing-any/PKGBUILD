# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-packaging
pkgname=(python-packaging python2-packaging)
pkgver=19.1
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pyparsing' 'python2-pyparsing')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-pretend' 'python2-pretend'
              'python-coverage' 'python2-coverage')
source=("https://pypi.io/packages/source/p/packaging/packaging-$pkgver.tar.gz")
sha512sums=('1dec7f49c325801eb85b11432f8a316d228bb1881a04ac546f5556d60f5fa33f8085d0e91bbd5abfeb30bfcb05ec0532ed75a977dc996e256b4dc8c27c10e79b')

build() {
  cd packaging-$pkgver
  python setup.py build
  python2 setup.py build
}

check() {
  cd packaging-$pkgver
  python setup.py pytest
  python2 setup.py pytest
}

package_python-packaging() {
  depends=('python-pyparsing' 'python-six')

  cd packaging-$pkgver
  python setup.py install --root "$pkgdir"
}

package_python2-packaging() {
  depends=('python2-pyparsing' 'python2-six')

  cd packaging-$pkgver
  python2 setup.py install --root "$pkgdir"
}
