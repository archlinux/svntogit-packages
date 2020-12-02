# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-ordered-set
pkgver=4.0.2
pkgrel=3
pkgdesc='A MutableSet that remembers its order, so that every entry has an index'
arch=('any')
url="https://github.com/LuminosoInsight/ordered-set"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/o/ordered-set/ordered-set-$pkgver.tar.gz")
md5sums=('5d88f3870c32d4868b28c8fe833f7e74')

build() {
  cd ordered-set-$pkgver
  python setup.py build
}

check() {
  cd ordered-set-$pkgver
  pytest --doctest-modules test.py ordered_set.py README.md --doctest-glob=README.md --ignore=setup.py
}

package() {
  cd ordered-set-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 MIT-LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
