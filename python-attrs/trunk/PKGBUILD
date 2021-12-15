# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-attrs
pkgver=21.2.0
pkgrel=4
pkgdesc="Attributes without boilerplate."
arch=('any')
license=('MIT')
url="https://attrs.readthedocs.org/"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-zope-interface' 'python-hypothesis')
source=("https://pypi.io/packages/source/a/attrs/attrs-$pkgver.tar.gz")
sha512sums=('35863f599076357e40f72a62968f4a2f9bc2af9f59f484fef051be4f9730ce9e28e11568915d690ade7980df8998af22e2ff8b9568a205d7745e246ba5f3a7e1')

build() {
  cd "$srcdir"/attrs-$pkgver
  python setup.py build
}

check() {
  cd attrs-$pkgver
  python setup.py pytest
}

package() {
  cd attrs-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
