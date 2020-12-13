# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-packaging
pkgname=(python-packaging python2-packaging)
pkgver=20.8
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
sha512sums=('77c77da9298635274de58b856b8738ab279749f736264212e6ecdeab47db607ea9c6ae696952f0702e9557d1fd2b89c7277a2c81ff55081593f49ebcd6eb74d4')

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
