# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alex Anthony <alex.anthony28991@gmail.com>

pkgname=python-markupsafe
pkgver=2.0.1
pkgrel=3
pkgdesc="Implements a XML/HTML/XHTML Markup safe string for Python"
arch=('x86_64')
url="https://pypi.python.org/pypi/MarkupSafe"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pallets/markupsafe/archive/$pkgver.tar.gz")
sha512sums=('f9a32c6aebd5057b85ac374d24d14b4ffbe627858932ba551c0cf60f4100afef17436a0c822f195d070b7f0cd73fb099d1726f07b50c30068a0bae500c6387e0')

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
