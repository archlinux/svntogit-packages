# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
pkgver=2.0.2
pkgrel=4
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir"'
arch=('any')
url="https://github.com/platformdirs/platformdirs"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/platformdirs/platformdirs-$pkgver.tar.gz")
sha512sums=('a342167cf10959b04535060dfffc11df42e046cfcf75c83c0eaa45ba314a864ff715f0764efd65aee5a404f39fe3c80a9f0fde6adf91b95cba7f508d01d09ab3')

build() {
  cd "$srcdir"/platformdirs-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/platformdirs-$pkgver
  python setup.py test
}

package() {
  cd platformdirs-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
