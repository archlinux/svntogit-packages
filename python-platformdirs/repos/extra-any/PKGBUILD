# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
pkgver=2.5.1
pkgrel=1
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir"'
arch=('any')
url="https://github.com/platformdirs/platformdirs"
license=('MIT')
depends=('python')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest-mock')
source=("https://pypi.io/packages/source/p/platformdirs/platformdirs-$pkgver.tar.gz")
sha512sums=('44e31df3f76475de2db4ca0e998d0540b87d7eb514fa139b80f26c2217bf7040d725ea1b89751f8660f0c41a59f63a9efc8c70919d0db8a1ce479821c7051e73')

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
