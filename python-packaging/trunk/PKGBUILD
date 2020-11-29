# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-packaging
pkgname=(python-packaging python2-packaging)
pkgver=20.5
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
makedepends=('python-dephell' 'python-setuptools' 'python2-setuptools' 'python-pyparsing'
             'python2-pyparsing')
checkdepends=('python-pytest' 'python2-pytest' 'python-pretend' 'python2-pretend'
              'python-coverage' 'python2-coverage')
source=("https://github.com/pypa/packaging/archive/$pkgver/$pkgbase-$pkgver.tar.gz")
sha512sums=('ef3c4853c30d9635b9372d6861cc0df8f7fc5a1d784e5f3effe3f315da0f24662ac939e70f55c6e9bb8864da95b9f75bc0df093f12c0f5c2af654b5354a5f081')

prepare() {
  cd packaging-$pkgver

  # poetry-generated setup.py is badly broken in several ways, including
  # distribution of tests in the built package as well as using distutils for
  # bad metadata. See https://github.com/sdispater/poetry/issues/866
  dephell deps convert --from pyproject.toml --to setup.py
}

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
