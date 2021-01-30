# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-packaging
pkgname=(python-packaging python2-packaging)
pkgver=20.9
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pyparsing' 'python2-pyparsing')
checkdepends=('python-pytest' 'python2-pytest' 'python-pretend' 'python2-pretend'
              'python-coverage' 'python2-coverage')
source=("https://github.com/pypa/packaging/archive/$pkgver/$pkgbase-$pkgver.tar.gz")
sha512sums=('fb71f1036cfaacbe94fdee663af31d6ad1960f73ecc95cba87b461c2d7d2ea90085853bb4682b146492d8c48f784b60ef082e3b1259269857166b143cd9a920b')

build() {
  cd packaging-$pkgver
  python setup.py build
  python2 setup.py build
}

check() {
  cd packaging-$pkgver
  python -m pytest
  python2 -m pytest
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
