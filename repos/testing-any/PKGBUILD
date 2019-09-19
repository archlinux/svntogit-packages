# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-packaging
pkgname=(python-packaging python2-packaging)
pkgver=19.2
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pyparsing' 'python2-pyparsing'
             'python-attrs' 'python2-attrs')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-pretend' 'python2-pretend'
              'python-coverage' 'python2-coverage')
source=("https://pypi.io/packages/source/p/packaging/packaging-$pkgver.tar.gz")
sha512sums=('af7312a85292f577d3e6e57154f10fb380bbdee749344ba4b226a09f22bf5ca664ed63c62cd5b4dea0be5eb5cff5c17ad04415aab8c925fa90dcae2e1c6dee5a')

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
  depends=('python-attrs' 'python-pyparsing' 'python-six')

  cd packaging-$pkgver
  python setup.py install --root "$pkgdir"
}

package_python2-packaging() {
  depends=('python2-attrs' 'python2-pyparsing' 'python2-six')

  cd packaging-$pkgver
  python2 setup.py install --root "$pkgdir"
}
