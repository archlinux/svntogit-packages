# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
pkgver=2.5.0
pkgrel=1
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir"'
arch=('any')
url="https://github.com/platformdirs/platformdirs"
license=('MIT')
depends=('python')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest-mock')
source=("https://pypi.io/packages/source/p/platformdirs/platformdirs-$pkgver.tar.gz")
sha512sums=('d45dde88061d11197c0aa8b9eeb47b3c2dd398a7aa3cc0489a9b30c4204aa277917091d59cd96081a2fa17f65c14f54206a7ab8c34818d41bceb219fec908c5f')

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
