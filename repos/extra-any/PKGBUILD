# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-attrs
pkgname=('python-attrs' 'python2-attrs')
pkgver=19.3.0
pkgrel=1
pkgdesc="Attributes without boilerplate."
arch=('any')
license=('MIT')
url="https://attrs.readthedocs.org/"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-zope-interface'
              'python2-zope-interface' 'python-hypothesis' 'python2-hypothesis')
source=("https://pypi.io/packages/source/a/attrs/attrs-$pkgver.tar.gz")
sha512sums=('b5b641e6732156d1454ed6c49e3a6b29200a8d3f1515fb59aeb85fcb5e9ab6a1d760904de45083cae5250e7bf1a7aa2c1f3ede217240a63f989ae4bb484f2511')

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
  cd "$srcdir"/attrs-$pkgver
  python setup.py pytest

  cd "$srcdir"/attrs-$pkgver-py2
  python2 setup.py pytest
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
