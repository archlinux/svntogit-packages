# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgbase=python-ordered-set
pkgname=(python-ordered-set python2-ordered-set)
pkgver=3.1.1
pkgrel=1
pkgdesc='A MutableSet that remembers its order, so that every entry has an index'
arch=('any')
url="https://github.com/LuminosoInsight/ordered-set"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest')
source=("https://pypi.io/packages/source/o/ordered-set/ordered-set-$pkgver.tar.gz")
md5sums=('6e12312c8dc4c90fe840e86e8a352644')

prepare() {
  cp -a ordered-set-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/ordered-set-$pkgver
  python setup.py build

  cd "$srcdir"/ordered-set-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/ordered-set-$pkgver
  pytest --doctest-modules test.py ordered_set.py README.md --doctest-glob=README.md --ignore=setup.py

  cd "$srcdir"/ordered-set-$pkgver-py2
  pytest2 --doctest-modules test.py ordered_set.py README.md --doctest-glob=README.md --ignore=setup.py
}

package_python-ordered-set() {
  depends=('python')

  cd ordered-set-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 MIT-LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_python2-ordered-set() {
  depends=('python2')

  cd ordered-set-$pkgver-py2
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 MIT-LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
