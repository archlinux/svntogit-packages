# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alex Anthony <alex.anthony28991@gmail.com>

pkgname=python-markupsafe
pkgver=2.1.0
pkgrel=1
pkgdesc="Implements a XML/HTML/XHTML Markup safe string for Python"
arch=('x86_64')
url="https://pypi.python.org/pypi/MarkupSafe"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("https://github.com/pallets/markupsafe/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2e267be868213dbeb9c99e58ba78ba5a363eddcc1a03d3fb26d96ba6b1c9cde34beb434af3b9a06cfa847fdefc0d4d3c13fdbba157bf0b898f900d0028b6eecf')

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
