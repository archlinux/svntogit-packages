# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-attrs
pkgver=22.2.0
pkgrel=3
pkgdesc="Attributes without boilerplate."
arch=('any')
license=('MIT')
url="https://www.attrs.org"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-cloudpickle' 'python-hypothesis' 'python-zope-interface')
source=("https://pypi.io/packages/source/a/attrs/attrs-$pkgver.tar.gz")
sha512sums=('a7707fb11e21cddd2b25c94c9859dc8306745f0256237493a4ad818ffaf005d1c1e84d55d07fce14eaea18fde4994363227286df2751523e1fe4ef6623562a20')

build() {
  cd attrs-$pkgver
  python setup.py build
}

check() {
  cd attrs-$pkgver
  PYTHONPATH=build/lib pytest
}

package() {
  cd attrs-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
