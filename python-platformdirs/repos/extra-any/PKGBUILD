# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
pkgver=2.6.2
pkgrel=1
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir"'
arch=('any')
url="https://github.com/platformdirs/platformdirs"
license=('MIT')
depends=('python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest-mock')
source=("https://pypi.io/packages/source/p/platformdirs/platformdirs-$pkgver.tar.gz")
sha512sums=('17ee79bf10eaddb4456b938d9058e6cfa4e959485868ba975ec27d0a16bdf895e03dfa8ab6275342a688cf0290f0b43e7c4b35cf2884e3c8f2472700bd8ea965')

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
