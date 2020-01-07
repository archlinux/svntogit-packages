# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-packaging
pkgname=(python-packaging python2-packaging)
pkgver=20.0
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pyparsing' 'python2-pyparsing')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-pretend' 'python2-pretend'
              'python-coverage' 'python2-coverage')
source=("https://pypi.io/packages/source/p/packaging/packaging-$pkgver.tar.gz")
sha512sums=('f7d99700d27d5aebbb3343f1de6ee9ce1372750b805c55a40d1a1fbeb6cfcfe2184875db56de175c6cd46e17f1567c30a39d5527870902c3c69168d025447587')

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
