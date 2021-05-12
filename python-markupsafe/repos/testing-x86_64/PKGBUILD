# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alex Anthony <alex.anthony28991@gmail.com>

pkgname=python-markupsafe
pkgver=2.0.0
pkgrel=1
pkgdesc="Implements a XML/HTML/XHTML Markup safe string for Python"
arch=('x86_64')
url="https://pypi.python.org/pypi/MarkupSafe"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pallets/markupsafe/archive/$pkgver.tar.gz")
sha512sums=('acbda651777caeb498da61cac09c89ad0192be402e4dbe6864cf586cd3e74dc34e625f7402f8e8f905ad350f9e8b3f536c5f31780043fe7fa6ad885e1742657b')

build() {
  cd markupsafe-$pkgver
  python setup.py build
}

check() {
  cd markupsafe-$pkgver
  python setup.py pytest
}

package() {
  cd markupsafe-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE.rst "$pkgdir"/usr/share/licenses/python-markupsafe/LICENSE.rst
}
