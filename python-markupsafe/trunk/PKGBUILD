# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alex Anthony <alex.anthony28991@gmail.com>

pkgname=python-markupsafe
pkgver=2.1.2
_commit=c0254f0cfe51720ecc9e72e8896022af29af5b44
pkgrel=3
pkgdesc="Implements a XML/HTML/XHTML Markup safe string for Python"
arch=('x86_64')
url="https://pypi.python.org/pypi/MarkupSafe"
license=('BSD')
depends=('python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
source=("git+https://github.com/pallets/markupsafe.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd markupsafe
  python setup.py build
}

check() {
  cd markupsafe
  PYTHONPATH=src pytest
}

package() {
  cd markupsafe
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.rst -t "$pkgdir"/usr/share/licenses/$pkgname/
}
