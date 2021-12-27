# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
pkgver=2.4.1
pkgrel=1
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir"'
arch=('any')
url="https://github.com/platformdirs/platformdirs"
license=('MIT')
depends=('python')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest-mock')
source=("https://pypi.io/packages/source/p/platformdirs/platformdirs-$pkgver.tar.gz")
sha512sums=('c2a71b2717b0d3d202be2b11a87e133c283b1cf8dc37d581a156b11c4a2376dfcf06f35965fd5bf7d0679100ef0e016d5f728e4c48a4f24374e14584c85c940f')

build() {
  cd "$srcdir"/platformdirs-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/platformdirs-$pkgver
  PYTHONPATH="$PWD"/build/lib pytest
}

package() {
  cd platformdirs-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
