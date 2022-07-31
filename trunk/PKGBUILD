# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
pkgver=2.5.2
pkgrel=1
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir"'
arch=('any')
url="https://github.com/platformdirs/platformdirs"
license=('MIT')
depends=('python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest-mock')
source=("https://pypi.io/packages/source/p/platformdirs/platformdirs-$pkgver.tar.gz")
sha512sums=('b0b0dee3ac4176e64f302b3d34e253b2e33784160051b9dafb563962e597df75f2c9f714c050d5bdeb1769a1f56c2878a47e9a42361596e287ae7b2afe870370')

build() {
  cd "$srcdir"/platformdirs-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir"/platformdirs-$pkgver
  PYTHONPATH="$PWD"/src pytest
}

package() {
  cd platformdirs-$pkgver
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
