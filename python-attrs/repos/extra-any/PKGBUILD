# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-attrs
pkgname=('python-attrs' 'python2-attrs')
pkgver=19.2.0
pkgrel=1
pkgdesc="Attributes without boilerplate."
arch=('any')
license=('MIT')
url="https://attrs.readthedocs.org/"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-zope-interface'
              'python2-zope-interface' 'python-hypothesis' 'python2-hypothesis')
source=("https://pypi.io/packages/source/a/attrs/attrs-$pkgver.tar.gz")
sha512sums=('c6239f5553d99f324a36193d9f6e684fdce26efcf4da866d1b995cd644909ec4b58ac6ef6c20a0fda4b8a16d00ec0aacfd3970a52b68997fd10804d5286b41c6')

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
