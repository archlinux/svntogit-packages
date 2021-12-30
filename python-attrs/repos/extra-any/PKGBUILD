# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-attrs
pkgver=21.3.0
pkgrel=1
pkgdesc="Attributes without boilerplate."
arch=('any')
license=('MIT')
url="https://attrs.readthedocs.org/"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-cloudpickle' 'python-hypothesis' 'python-zope-interface')
source=("https://pypi.io/packages/source/a/attrs/attrs-$pkgver.tar.gz")
sha512sums=('23b2ba52af809581e9907ad7c6d18ed050d415645a249ae912af3f1398276ea5bf67f11991d7958f3eeafe759d8d62a65009555ae8f75580cfa464c5b4a37742')

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
