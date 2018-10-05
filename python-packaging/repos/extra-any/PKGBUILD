# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-packaging
pkgname=(python-packaging python2-packaging)
pkgver=18.0
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pyparsing' 'python2-pyparsing')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-pretend' 'python2-pretend'
              'python-coverage' 'python2-coverage')
source=("https://pypi.io/packages/source/p/packaging/packaging-$pkgver.tar.gz")
sha512sums=('9f7cab9bdd756cc49192379b8381f81d218d3201e071498f2f6fd0307b1c46ad1a8c8b9d4f27e62d5f469eb05603a57be54deb8a5e0dbc2cf542e436a7127b34')

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
