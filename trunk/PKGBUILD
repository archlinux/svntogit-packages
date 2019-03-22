# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributer: Allan McRae <allan@archlinux.org>

pkgbase=python-six
pkgname=('python2-six' 'python-six')
pkgver=1.12.0
pkgrel=1
pkgdesc="Python 2 and 3 compatibility utilities"
arch=('any')
url="https://pypi.python.org/pypi/six/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest' 'tk')
source=("https://pypi.io/packages/source/s/six/six-$pkgver.tar.gz")
sha512sums=('937728372edf1e0ac13bbd706723d0de35e015c30d0ae41f789c5ed2e3669bb0db70cdc6e036ec2d437a6c4aa0d5d1e727b6d09ac34cca7e4e92e5d3b4775151')

build() {
  cp -a six-$pkgver{,-py2}
}

check() {
  cd "$srcdir"/six-$pkgver
  python -m pytest

  cd "$srcdir"/six-$pkgver-py2
  python2 -m pytest
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
