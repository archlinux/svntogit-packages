# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-hyperlink
pkgname=('python-hyperlink' 'python2-hyperlink')
pkgver=18.0.0
pkgrel=2
pkgdesc='A featureful, correct URL for Python'
arch=('any')
license=('BSD')
url='https://github.com/python-hyper/hyperlink'
makedepends=('python-idna' 'python2-idna' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/python-hyper/hyperlink/archive/v$pkgver.tar.gz")
sha512sums=('b50bdd7a635804da449a6f2902e833f39d408e72a2b8e46a8b2bb773e2c310e0d4dced3f683951f8777e6104fe8d4faa4390f1a677bfb257c0e88dff860f1523')

prepare() {
  cp -a hyperlink-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/hyperlink-$pkgver
  python setup.py build

  cd "$srcdir"/hyperlink-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/hyperlink-$pkgver
  python setup.py pytest

  cd "$srcdir"/hyperlink-$pkgver-py2
  python2 setup.py pytest
}

package_python-hyperlink() {
  depends=('python-idna')

  cd hyperlink-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-hyperlink() {
  depends=('python2-idna')

  cd hyperlink-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
