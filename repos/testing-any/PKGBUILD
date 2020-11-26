# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-attrs
pkgname=('python-attrs' 'python2-attrs')
pkgver=20.3.0
pkgrel=3
pkgdesc="Attributes without boilerplate."
arch=('any')
license=('MIT')
url="https://attrs.readthedocs.org/"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python-zope-interface' 'python-hypothesis')
source=("https://pypi.io/packages/source/a/attrs/attrs-$pkgver.tar.gz")
sha512sums=('640532c6b763fd96572e5d85e93c111bebc4c5e0ff9419fe92fb51280f03acb5f9f43339f57d30659e777d5578460675c60ec0a362f9ad433893e3624ce6a931')

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
