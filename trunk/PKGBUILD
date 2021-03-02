# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alex Anthony <alex.anthony28991@gmail.com>

pkgname=python-markupsafe
pkgver=1.1.1
pkgrel=7
pkgdesc="Implements a XML/HTML/XHTML Markup safe string for Python"
arch=('x86_64')
url="https://pypi.python.org/pypi/MarkupSafe"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pallets/markupsafe/archive/$pkgver.tar.gz")
sha512sums=('c2a1072c5dd0918e47f9cfbd30b79b0690a43635f7cfc3fdd27f3df52f8e20406d7e3cfadd29df8ab1d1110f50e23eb7c7272707e0739d862d4b1edb59bbc241')

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
