# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
pkgver=3.1.1
pkgrel=3
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir"'
arch=('any')
url="https://github.com/platformdirs/platformdirs"
license=('MIT')
depends=('python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest-mock' 'python-appdirs')
source=("https://pypi.io/packages/source/p/platformdirs/platformdirs-$pkgver.tar.gz")
sha512sums=('537557370a05f78279c88cdda4b5abfbe1d2e6d91d69c4dd4049c6b1a8ac3e44a830d787e2b86af85c346e0244a6ba26233db061d7c8d0a3fbd141962609930d')

build() {
  cd platformdirs-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd platformdirs-$pkgver
  PYTHONPATH="$PWD"/src pytest
}

package() {
  cd platformdirs-$pkgver
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
