# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-ordered-set
pkgver=4.1.0
pkgrel=4
pkgdesc='A MutableSet that remembers its order, so that every entry has an index'
arch=('any')
url="https://github.com/rspeer/ordered-set"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-flit-core' 'python-installer')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/o/ordered-set/ordered-set-$pkgver.tar.gz")
sha512sums=('f12d19f7d9cf0ebcc414d97798f0959ff69a77146839cc6a9067c864f9e0be795795c4d648f736fd7448ddf89666ce37f23e7380d1c9b1678a4787961e4e1e79')

build() {
  cd ordered-set-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ordered-set-$pkgver
  pytest
}

package() {
  cd ordered-set-$pkgver
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 MIT-LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
