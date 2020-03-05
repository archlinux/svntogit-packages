# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-packaging
pkgname=(python-packaging python2-packaging)
pkgver=20.2
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pyparsing' 'python2-pyparsing')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-pretend' 'python2-pretend'
              'python-coverage' 'python2-coverage')
source=("https://pypi.io/packages/source/p/packaging/packaging-$pkgver.tar.gz")
sha512sums=('ef792187c6c6a4aaa29b1323a5cdb833f10849d18b60b2ba36c166b86cd8e41dd4689554c1ccafe10048115b5124845a89359ba3d5f4cb87225d17399f1e0f04')

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
