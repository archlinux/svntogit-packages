# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alex Anthony <alex.anthony28991@gmail.com>

pkgbase=python-markupsafe
pkgname=('python-markupsafe' 'python2-markupsafe')
pkgver=1.1.0
pkgrel=1
pkgdesc="Implements a XML/HTML/XHTML Markup safe string for Python"
arch=('x86_64')
url="http://pypi.python.org/pypi/MarkupSafe"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/pallets/markupsafe/archive/$pkgver.tar.gz")
sha512sums=('898045cceb2d59c263d171a9662ee273fe80a16454d6e38aaef03db953a04b306a1076e9006d4bca05aa11dcc5c538f410d6b8c63cb5e16dcd0047be975a0bd8')

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
