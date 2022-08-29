# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-attrs
pkgver=22.1.0
pkgrel=1
pkgdesc="Attributes without boilerplate."
arch=('any')
license=('MIT')
url="https://www.attrs.org"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-cloudpickle' 'python-hypothesis' 'python-zope-interface')
source=("https://pypi.io/packages/source/a/attrs/attrs-$pkgver.tar.gz")
sha512sums=('447637bc82b31d565479e364869b996eaf7b67e526ad97f79ba1c27f287bbb25a2c40663e35437bc19037f605fac9322bd35f303f2769f0eb2ee673900551885')

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
