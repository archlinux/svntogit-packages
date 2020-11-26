# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alex Anthony <alex.anthony28991@gmail.com>

pkgbase=python-markupsafe
pkgname=('python-markupsafe' 'python2-markupsafe')
pkgver=1.1.1
pkgrel=6
pkgdesc="Implements a XML/HTML/XHTML Markup safe string for Python"
arch=('x86_64')
url="https://pypi.python.org/pypi/MarkupSafe"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/pallets/markupsafe/archive/$pkgver.tar.gz")
sha512sums=('c2a1072c5dd0918e47f9cfbd30b79b0690a43635f7cfc3fdd27f3df52f8e20406d7e3cfadd29df8ab1d1110f50e23eb7c7272707e0739d862d4b1edb59bbc241')

build() {
  cd markupsafe-$pkgver
  python setup.py build
  python2 setup.py build
}

check() {
  cd markupsafe-$pkgver
  python setup.py pytest
  python2 setup.py pytest
}

package_python-markupsafe() {
  depends=('python')

  cd markupsafe-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE.rst "$pkgdir"/usr/share/licenses/python-markupsafe/LICENSE.rst
}

package_python2-markupsafe() {
  depends=('python2')

  cd markupsafe-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE.rst "$pkgdir"/usr/share/licenses/python2-markupsafe/LICENSE.rst
}
