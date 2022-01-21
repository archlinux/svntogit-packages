# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-attrs
pkgver=21.4.0
pkgrel=1
pkgdesc="Attributes without boilerplate."
arch=('any')
license=('MIT')
url="https://attrs.readthedocs.org/"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-cloudpickle' 'python-hypothesis' 'python-zope-interface')
source=("https://pypi.io/packages/source/a/attrs/attrs-$pkgver.tar.gz")
sha512sums=('5a52776eb505c8a354912fa037a9710e49830fa6ad37272cb6d8c3298f4179a5b237e36cd7db3b1c9af19fbf0194ad6b83c3db9a473f9349769180073273ba65')

build() {
  cd "$srcdir"/attrs-$pkgver
  python setup.py build
}

check() {
  cd attrs-$pkgver
  PYTHONPATH=build/lib pytest
}

package() {
  cd attrs-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
