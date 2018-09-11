# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-packaging
pkgname=(python-packaging python2-packaging)
pkgver=17.1
_commit=0dfec396998e7237e12dc2e3a06385ffa1bd97b1
pkgrel=2
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pyparsing' 'python2-pyparsing')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-pretend' 'python2-pretend'
              'python-coverage' 'python2-coverage')
source=("$pkgbase-$_commit.tar.gz::https://github.com/pypa/packaging/archive/$_commit.tar.gz")
sha512sums=('00f0ac87794813372931b31c5dd52f76153b0fa8fc21c2a1d5dafdd792e12ef0d87503aa7bbceb8642f777900dcaccfafca77dc391c5afdce1471a7ba9c4021e')

prepare() {
  mv packaging-{$_commit,$pkgver}
  cp -a packaging-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/packaging-$pkgver
  python setup.py build

  cd "$srcdir"/packaging-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/packaging-$pkgver
  python setup.py pytest

  cd "$srcdir"/packaging-$pkgver-py2
  python2 setup.py pytest
}

package_python-packaging() {
  depends=('python-pyparsing' 'python-six')

  cd "$srcdir"/packaging-$pkgver
  python setup.py install --root "$pkgdir"
}

package_python2-packaging() {
  depends=('python2-pyparsing' 'python2-six')

  cd "$srcdir"/packaging-$pkgver-py2
  python2 setup.py install --root "$pkgdir"
}
