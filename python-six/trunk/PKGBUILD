# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributer: Allan McRae <allan@archlinux.org>

pkgbase=python-six
pkgname=('python2-six' 'python-six')
pkgver=1.11.0
pkgrel=3
pkgdesc="Python 2 and 3 compatibility utilities"
arch=('any')
url="http://pypi.python.org/pypi/six/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'tk')
source=("https://pypi.io/packages/source/s/six/six-$pkgver.tar.gz")
sha512sums=('33f246a2e987141e17e5edad9d3537cf3aba0cbdd0bc2a907ea52ce0d674b1474f29c3dd5cc26605fd960396054b189ca5f501708333cad234c223131483fe24')

build() {
  cp -a six-$pkgver{,-py2}
}

check() {
  cd "$srcdir"/six-$pkgver
  python setup.py pytest

  cd "$srcdir"/six-$pkgver-py2
  python2 setup.py pytest
}

package_python-six() {
  depends=('python')

  cd six-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-six() {
  depends=('python2')

  cd six-$pkgver-py2
  python2 setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
