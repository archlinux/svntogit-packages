# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
pkgver=2.5.4
pkgrel=1
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir"'
arch=('any')
url="https://github.com/platformdirs/platformdirs"
license=('MIT')
depends=('python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest-mock')
source=("https://pypi.io/packages/source/p/platformdirs/platformdirs-$pkgver.tar.gz")
sha512sums=('1b7ff79a421bc0b0320a9b1ba8f99dbbecd34a9bea7fa7696b58007f2e05d8a910a3f32e2c03e6e3a8f3d272ab1c045051a682e3155c5bc5285e66e4add59489')

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
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
