# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
pkgver=3.5.1
pkgrel=1
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir"'
arch=('any')
url="https://github.com/platformdirs/platformdirs"
license=('MIT')
depends=('python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest-mock' 'python-appdirs')
source=("https://pypi.io/packages/source/p/platformdirs/platformdirs-$pkgver.tar.gz")
sha512sums=('e3aa38bc943f9dc709dfaa3c6fe9e11f3b33d4263d1d41f7349d9926db2e41a36dd43c74ea2175ad89b107601f2dffded0f45e7703b9cb8ca9739945dee3c6fb')

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
