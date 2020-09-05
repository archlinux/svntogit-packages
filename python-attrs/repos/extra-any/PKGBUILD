# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-attrs
pkgname=('python-attrs' 'python2-attrs')
pkgver=20.2.0
pkgrel=1
pkgdesc="Attributes without boilerplate."
arch=('any')
license=('MIT')
url="https://attrs.readthedocs.org/"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python-zope-interface' 'python-hypothesis')
source=("https://pypi.io/packages/source/a/attrs/attrs-$pkgver.tar.gz")
sha512sums=('829030d8c1fe7bffbbb8d70fc56228f4c378d85a24c89d802e51f63a78abbfa24f46f5aa8b56cb7ba26ef0bf1fb272163873c45c994145de0be45b14c6fb29cd')

prepare() {
  cp -a attrs-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/attrs-$pkgver
  python setup.py build

  cd "$srcdir"/attrs-$pkgver-py2
  python2 setup.py build
}

check() {
  cd attrs-$pkgver
  python setup.py pytest
}

package_python-attrs() {
  depends=('python')

  cd attrs-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-attrs() {
  depends=('python2')

  cd attrs-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
